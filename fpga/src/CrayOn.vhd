----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Additional Comments: 
-- Top Level of our Convolutional Network Processor
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CrayOn is
	Generic( 
		VL : natural;	-- ALU width
		D  : natural;	-- convolution array dim.
		W  : natural;	-- arith. precision 
		Fm : natural;	-- fractional part - map values
		Fp : natural;	-- fractional part - parameters
		Wi : natural);	-- input precision 
    Port (  
		clk			: in std_logic;
		-- Synchronize
		start_i		: in std_logic;
		request_i	: in std_logic_vector(3 downto 0);
		-- Read inputs:
		ib_addr_o	: out std_logic_vector(16 downto 0);
		ib_data_i	: in std_logic_vector(Wi-1 downto 0);
		-- Store results:
		rb_addr_o	: out std_logic_vector(16 downto 0);
		rb_en_o		: out std_logic;
		rb_data_o	: out std_logic_vector(7 downto 0)
		--workload_o : out std_logic;
	);
end CrayOn;

architecture structural of CrayOn is

	-- Start signals (to the local controller)
	signal start_conv_s			: std_logic := '0';
	signal start_store_s		: std_logic := '0';
	signal start_fire_s			: std_logic := '0';
	
	-- Request signals
	signal propagate_s			: std_logic := '0';
	signal load_kernel_s		: std_logic := '0';
	signal load_program_s		: std_logic := '0';
	signal request_config_s	: std_logic_vector(1 downto 0); 

	-- CCU data loading
	signal load_data_s			: std_logic_vector(7 downto 0); 
	signal load_addr_s			: std_logic_vector(16 downto 0); 
	
	-- Parameter BUS
	signal fill_mode_s			: std_logic := '0';
	signal acc_mode_s			: std_logic := '0';
	signal pool_mode_s			: std_logic := '0';
	signal rect_mode_s			: std_logic_vector(2 downto 0);
	signal store_index_s		: std_logic_vector(7 downto 0);
	signal store_select_s		: std_logic_vector(3 downto 0);
	signal cyclic_order_s		: std_logic_vector(3 downto 0); 			  
	signal block_width_s		: std_logic_vector(8 downto 0);
	signal block_size_s			: std_logic_vector(16 downto 0);
	signal input_index_s		: std_logic_vector(3 downto 0);
	signal output_index_s		: std_logic_vector(3 downto 0);

	-- Routing
	signal ribbon_s				: std_logic_vector(VL*W-1 downto 0);
	signal ribbon_routed_s		: std_logic_vector(VL*W-1 downto 0);

	-- Instructions
	signal en_conv_s			: std_logic;
	signal conv_addr_read_s		: std_logic_vector(16 downto 0);
	signal conv_addr_write_s	: std_logic_vector(16 downto 0);
	signal en_store_s			: std_logic;
	signal store_addr_write_s	: std_logic_vector(16 downto 0);
	signal en_fire_s			: std_logic;
	signal fire_addr_write_s	: std_logic_vector(16 downto 0);
	signal map_addr_read_s		: std_logic_vector(16 downto 0);

	-- Store
	signal map_ribbon_s			: std_logic_vector(VL*W-1 downto 0); 
	signal store_data_s			: std_logic_vector(W-1 downto 0);
	
	-- Fill
	signal fill_addr_s			: std_logic_vector(16 downto 0);
	signal fill_data_s			: std_logic_vector(W-1 downto 0);

	-- Kernel Load
	signal en_push_kernel_s		: std_logic;
	signal weight_value_s		: std_logic_vector(W-1 downto 0);
	type bridge is array (0 to VL) of std_logic_vector(W-1 downto 0);
	signal kernel_bridge_s		: bridge;

begin

	-- Central Control Unit (CCU)
	I_CCU: entity work.CCU
	Generic map (VL => VL, W => W, D => D)
	Port map (
		clk					=> clk,
		-- Request
		propagate_i			=> propagate_s,
		load_kernel_i		=> load_kernel_s,
		load_program_i		=> load_program_s,
		request_config_i	=> request_config_s,
		-- Data loading
		load_data_i			=> load_data_s,
		load_addr_o			=> load_addr_s,	
		-- Start signals
		start_conv_o		=> start_conv_s,
		start_store_o		=> start_store_s,
		start_fire_o		=> start_fire_s,
		-- P-BUS
		fill_mode_o			=> fill_mode_s,
		acc_mode_o			=> acc_mode_s,
		pool_mode_o			=> pool_mode_s,
		rect_mode_o			=> rect_mode_s,
		store_index_o		=> store_index_s,
		store_select_o		=> store_select_s,
		cyclic_order_o		=> cyclic_order_s,			  
		block_width_o		=> block_width_s,
		block_size_o		=> block_size_s,
		input_index_o		=> input_index_s,
		output_index_o		=> output_index_s,
		-- Kernel Load
		en_push_kernel_o 	=> en_push_kernel_s,
		weight_value_o		=> weight_value_s	
	);
	
	-- Dataflow Controller
	I_DMA: entity work.DMA
	Port map (
		clk 				=> clk,
		block_size_i 		=> block_size_s,
		block_width_i 		=> block_width_s,
		-- Offseting
		input_index_i 		=> input_index_s, -- HERE !
		output_index_i 		=> output_index_s, -- HERE !
		-- Convolution
		start_conv_i 		=> start_conv_s,
		en_conv_o 			=> en_conv_s,
		conv_addr_read_o 	=> conv_addr_read_s,
		conv_addr_write_o 	=> conv_addr_write_s,
		-- Store
		start_store_i 		=> start_store_s,
		store_index_i 		=> store_index_s,
		en_store_o 			=> en_store_s,
		store_addr_write_o 	=> store_addr_write_s,
		-- Fire
		start_fire_i 		=> start_fire_s,
		pool_mode_i 		=> pool_mode_s,
		en_fire_o 			=> en_fire_s,
		fire_addr_write_o 	=> fire_addr_write_s,
		--Address used to read in the map buffer (conv, fire, store, ...)
		map_addr_read_o 	=> map_addr_read_s
	);

	-- NPU Line Assembly
	G_Assembly: for k in 0 to VL-1 generate
	
		I_NPU: entity work.NPU
		Generic map (VL => VL, W => W, Fp => Fp, Fm => Fm, D => D) 	
		Port map (
			clk 				=> clk,
			block_width_i 		=> block_width_s,
			-- Push kernel
			en_push_kernel_i 	=> en_push_kernel_s,
			kernel_i 			=> kernel_bridge_s(k+1), 
			kernel_o 			=> kernel_bridge_s(k),
			-- Convolution (activ. buffer to map buffer)
			en_conv_i 			=> en_conv_s, 
			acc_mode_i 			=> acc_mode_s,
			conv_data_i 		=> ribbon_routed_s(W*(VL-k)-1 downto W*(VL-k-1)),
			conv_addr_write_i 	=> conv_addr_write_s,
			-- Fire (map buffer to activ. buffer)
			en_fire_i 			=> en_fire_s,
			pool_mode_i 		=> pool_mode_s,
			rect_mode_i 		=> rect_mode_s,
			fire_addr_write_i 	=> fire_addr_write_s,
			-- Store (map buffer to result buffer)
			map_addr_read_i		=> map_addr_read_s,
			map_data_o			=> map_ribbon_s(W*(VL-k)-1 downto W*(VL-k-1)),
			-- Routing (activ. buffer to router)
			activ_addr_read_i	=> conv_addr_read_s,
			activ_data_o		=> ribbon_s(W*(VL-k)-1 downto W*(VL-k-1))
		);
		
	end generate G_Assembly;
		
	kernel_bridge_s(VL) <= weight_value_s;

	-- Interconnexion Router
	I_Router: entity work.Router
	Generic map (VL => VL, W => W)
	Port map ( 
		clk					=> clk,
		-- Stream-Unit interconnexion
		fill_mode_i 		=> fill_mode_s, 
		input_data_i 		=> fill_data_s,
		activ_ribbon_i 		=> ribbon_s,
		activ_select_i		=> cyclic_order_s, 
		activ_ribbon_o 		=> ribbon_routed_s,
		-- Store the feature maps
		map_select_i 		=> store_select_s, 
		map_ribbon_i 		=> map_ribbon_s, 
		store_data_o 		=> store_data_s
	);
	
	-- Interrupt request decoder
	I_Decoder: entity work.Decoder
	Port map ( 
		clk					=> clk,
		start_i 			=> start_i, 
		request_i 			=> request_i,
		--------------------------------
		propagate_o 		=> propagate_s,
		load_kernel_o		=> load_kernel_s, 
		load_program_o 		=> load_program_s,
		request_config_o	=> request_config_s
	);
	
	-- Multiplex the access to the input buffer (WARN: require to hold the request)
	ib_addr_o <= fill_addr_s when (propagate_s = '1') else load_addr_s;
		
	-- Register and normalize in/out
	P_latch: process(clk)
	begin
		if rising_edge(clk) then
		
			-- Fill (the following will work only for Fm >= 8)
			fill_addr_s <= conv_addr_read_s;
			fill_data_s <= (W-1 downto Fm+1 => ib_data_i(Wi-1)) & ib_data_i & (Fm-Wi downto 0 => '0');
			
			-- Register loading data
			load_data_s <= ib_data_i;
	
			-- Store (with a shift of 2 bits)
			rb_en_o   <= en_store_s;
			rb_data_o <= store_data_s(Fm+1 downto Fm-Wi+2); 
			rb_addr_o <= store_addr_write_s;
			
		end if;	
	end process;

end structural;
