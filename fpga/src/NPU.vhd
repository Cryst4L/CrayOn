-------------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description : 
-- Neural Processing Unit. Performs the (sparse) convolutional connectivity,
-- the activation and pooling operation, and store the feature and activation maps.
-------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NPU is
	Generic ( 
			VL	: natural;
			D	: natural;
			W	: natural;
			Fp	: natural;
			Fm	: natural);
	Port (  clk					: in  std_logic;
			block_width_i		: in std_logic_vector(8 downto 0);
			-- Push kernel
			en_push_kernel_i	: in std_logic;
			kernel_i			: in std_logic_vector(W-1 downto 0);
			kernel_o			: out std_logic_vector(W-1 downto 0);
			-- Convolution (activ. buffer to map buffer)
			en_conv_i			: in std_logic;
			acc_mode_i			: in std_logic;
			conv_data_i			: in std_logic_vector(W-1 downto 0);
			conv_addr_write_i	: in std_logic_vector(16 downto 0);
			-- Fire (map buffer to activ. buffer)
			en_fire_i			: in std_logic;
			pool_mode_i			: in std_logic;
			rect_mode_i			: in std_logic_vector(2 downto 0);
			fire_addr_write_i	: in std_logic_vector(16 downto 0);
			-- Store (map buffer to result buffer)
			map_addr_read_i		: in std_logic_vector(16 downto 0);
			map_data_o			: out std_logic_vector(W-1 downto 0); 
			-- Routing (activ. buffer to router)
			activ_addr_read_i	: in std_logic_vector (16 downto 0);
			activ_data_o		: out std_logic_vector (W-1 downto 0)
			);  
end NPU;

architecture dataflow of NPU is

	--Internal signals
	signal convolved_data_s		: std_logic_vector(W-1 downto 0);
	signal fired_data_s			: std_logic_vector(W-1 downto 0);
	signal mode_mask_s			: std_logic_vector(W-1 downto 0);

	--I/O signals
	signal en_fire_s			: std_logic_vector(0 downto 0);
	signal fire_addr_write_s	: std_logic_vector(16 downto 0);
	signal en_conv_s			: std_logic_vector(0 downto 0);
	signal conv_data_s			: std_logic_vector(W-1 downto 0);
	signal conv_addr_write_s	: std_logic_vector(16 downto 0);
	signal map_addr_read_s		: std_logic_vector(16 downto 0);
	signal activ_addr_read_s	: std_logic_vector(16 downto 0);
	signal activ_data_s			: std_logic_vector(W-1 downto 0);
	signal map_data_s			: std_logic_vector(W-1 downto 0);
	
begin

	mode_mask_s <= (others => acc_mode_i);
	
	I_ConvolutionUnit : entity work.ConvolutionUnit 
		Generic map(W=>W, Fp=>Fp, Fm=>Fm, D=>D)
		Port map ( 
			clk					=> clk,
			block_width_i		=> block_width_i, --118=128-10 
			-- Push Kernel
			en_push_kernel_i	=> en_push_kernel_i, 
			kernel_i			=> kernel_i,
			kernel_o			=> kernel_o,
			-- Convolution
			conv_data_i			=> conv_data_s,
			acc_data_i			=> (map_data_s and mode_mask_s),
			conv_data_o			=> convolved_data_s
		);
		
	I_map_buffer: entity work.map_buffer 
		Port map ( 
			clka		=> clk,
			wea			=> en_conv_s,  
			addra		=> conv_addr_write_s, 
			dina		=> convolved_data_s,
			clkb		=> clk,
			addrb		=> map_addr_read_s, 
			doutb		=> map_data_s
		);
			
	I_ActivationUnit : entity work.ActivationUnit 
		Generic map(W => W, Fm => Fm)
		Port map ( 
			clk			=> clk,
			sync_i		=> en_fire_s(0),
			pool_mode_i	=> pool_mode_i,
			rect_mode_i => rect_mode_i,--"010",
			data_i		=> map_data_s,
			data_o		=> fired_data_s
		);

	I_activation_buffer : entity work.activation_buffer 
		Port map ( 
			clka		=> clk,
			wea			=> en_fire_s,  
			addra		=> fire_addr_write_s(14 downto 0), 
			dina		=> fired_data_s,
			clkb		=> clk,
			addrb		=> activ_addr_read_s(14 downto 0), 
			doutb		=> activ_data_s
		);
		
	-- Register I/Os
	P_reg: process(clk)
	begin
		if rising_edge(clk) then
		
			--Inputs
			en_conv_s(0)		<= en_conv_i;
			conv_data_s			<= conv_data_i;
			conv_addr_write_s	<= conv_addr_write_i;
			map_addr_read_s		<= map_addr_read_i;
			en_fire_s(0)		<= en_fire_i;
			fire_addr_write_s	<= fire_addr_write_i;
			activ_addr_read_s	<= activ_addr_read_i;
			
			--Outputs
			activ_data_o		<= activ_data_s;
			map_data_o			<= map_data_s;
			
		end if;	
	end process;

end dataflow;

