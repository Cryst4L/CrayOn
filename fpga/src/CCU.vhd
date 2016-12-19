----------------------------------------------------------------------
-- Engineer: B Halimi
-- Description:
-- Central Control Unit (CCU) of the CrayOn architecture. 
-- Unite the master control logic with the program memory and  
-- everything related to the loading of the network's parameters
----------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CCU is
    generic (
		VL	: natural;
		W	: natural; 
		D	: natural);
    port (
        clk               : in std_logic;
		-- Requests
		propagate_i			: in std_logic;
		load_kernel_i		: in std_logic;
		load_program_i		: in std_logic;	
		request_config_i	: in std_logic_vector(1 downto 0);
		-- Data loading
		load_data_i			: in std_logic_vector(7 downto 0);
		load_addr_o			: out std_logic_vector(16 downto 0);
        -- Start signals
        start_conv_o		: out std_logic;
        start_store_o		: out std_logic;
        start_fire_o		: out std_logic;
        -- P-bus
        fill_mode_o			: out std_logic;
        acc_mode_o			: out std_logic;
        pool_mode_o			: out std_logic;
        rect_mode_o			: out std_logic_vector(2 downto 0);
        store_index_o		: out std_logic_vector(7 downto 0);
        store_select_o		: out std_logic_vector(3 downto 0);
        cyclic_order_o		: out std_logic_vector(3 downto 0); 
        block_width_o		: out std_logic_vector(8 downto 0);
        block_size_o		: out std_logic_vector(16 downto 0);
		input_index_o		: out std_logic_vector(3 downto 0);
		output_index_o		: out std_logic_vector(3 downto 0);
        -- Kernel Load
        en_push_kernel_o	: out std_logic;
        weight_value_o		: out std_logic_vector(W-1 downto 0) 
    );
end CCU;

architecture behavioral of CCU is

    signal instruction_s	: std_logic_vector(15 downto 0)	:= (others => '0');
    signal stack_pointer_s	: std_logic_vector(11 downto 0)	:= (others => '0');
	
    signal push_kernel_s	: std_logic := '0'; -- it's a start signal!
    signal kernel_index_s	: std_logic_vector(9 downto 0)	:= (others => '0');
    
   	signal kernel_addr_s	: std_logic_vector(16 downto 0) := (others => '0');
   	signal program_addr_s	: std_logic_vector(16 downto 0) := (others => '0');

begin
    -- Central State Machine
    I_Master : entity work.Master
	generic map(VL => VL, D => D)
	port map(
		clk					=> clk,
		sync_i				=> propagate_i,
		-- µProgram Memory read
		instruction_i		=> instruction_s, 
		stack_pointer_o		=> stack_pointer_s, 
		-- Kernel Memory
		push_kernel_o		=> push_kernel_s, 
		kernel_index_o		=> kernel_index_s, 
		-- Local Controller signals
		start_conv_o		=> start_conv_o, 
		start_store_o		=> start_store_o, 
		start_fire_o		=> start_fire_o, 
		-- Config bus
		fill_mode_o			=> fill_mode_o, 
		acc_mode_o			=> acc_mode_o, 
		pool_mode_o			=> pool_mode_o,
		rect_mode_o			=> rect_mode_o,
		cyclic_order_o		=> cyclic_order_o, 		
		block_width_o		=> block_width_o, 
		block_size_o		=> block_size_o,
		store_index_o		=> store_index_o, 
		store_select_o		=> store_select_o,
		input_index_o		=> input_index_o,
		output_index_o		=> output_index_o
	);

    -- Kernel Loading Unit
    I_KLU : entity work.KLU
	generic map(VL => VL, W => W, D => D)
	port map (
		clk					=> clk, 
		-- receive a push kernel order
		push_kernel_i		=> push_kernel_s, 
		kernel_index_i		=> kernel_index_s, 
		-- push the corresponding kernel
		weight_value_o		=> weight_value_o, 
		en_push_kernel_o	=> en_push_kernel_o,
		-- load the parameters from the input buffer
		load_kernel_i		=> load_kernel_i,
		load_index_i		=> request_config_i,
		load_data_read_i	=> load_data_i,
		load_addr_read_o	=> kernel_addr_s
	);

    -- Program Memory  
    I_PRAM : entity work.PRAM
	port map ( 
		clk  				 => clk,
		-- read an instruction
		stack_pointer_i		=> stack_pointer_s,
		instruction_o		=> instruction_s,
		-- load the program from the input buffer 
		load_program_i		=> load_program_i,
		load_data_read_i	=> load_data_i,
		load_addr_read_o	=> program_addr_s
	);			  
	
	-- Multiplex the access to the input buffer	
	load_addr_o <= kernel_addr_s when (load_kernel_i = '1') else program_addr_s;
 
end behavioral;