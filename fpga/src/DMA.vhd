----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: DMA of the Connexion and Activation Unit (CAU).
-- Control the data-flows between the NPUs and the connexion router, 
-- depending on the nature of the operation called. Works in a SIMD fashion.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DMA is
	Port (
		clk					: in std_logic;
		block_size_i		: in std_logic_vector (16 downto 0);
		block_width_i		: in std_logic_vector (8 downto 0);
		--offsetting
		input_index_i		: in std_logic_vector (3 downto 0);
		output_index_i		: in std_logic_vector (3 downto 0);
		--convolution
		start_conv_i		: in std_logic;
		en_conv_o			: out std_logic;
		conv_addr_read_o	: out std_logic_vector (16 downto 0);
		conv_addr_write_o	: out std_logic_vector (16 downto 0);
		--store
		start_store_i		: in std_logic;
		store_index_i		: in std_logic_vector (7 downto 0);
		en_store_o			: out std_logic;
		store_addr_write_o	: out std_logic_vector (16 downto 0);
		--fire
		start_fire_i		: in  std_logic;
		pool_mode_i			: in std_logic;
		fire_addr_write_o	: out std_logic_vector (16 downto 0);
		en_fire_o			: out std_logic;
		--addresse d'acces dans l'output_buffer (conv, fire, store, ...)
		map_addr_read_o		: out std_logic_vector (16 downto 0)
	);
end DMA;

architecture behavioral of DMA is

	-- requête de lecture dans l'output buffer
	signal acc_map_addr_s	: std_logic_vector(16 downto 0);
	signal fire_map_addr_s	: std_logic_vector(16 downto 0);
	signal store_map_addr_s	: std_logic_vector(16 downto 0);

	--latch de la résolution d'addresse (qui slice un max)
	signal map_addr_read_s	:std_logic_vector (16 downto 0);

begin

	-- Convolution Controller
	I_ConvControl: entity work.ConvControl
	Port map( 
			clk				=> clk,
			start_i			=> start_conv_i,
			block_size_i	=> block_size_i,
			input_index_i	=> input_index_i,
			output_index_i	=> output_index_i,
			en_conv_o		=> en_conv_o,
			---------------
			addr_read_o		=> conv_addr_read_o,
			addr_write_o	=> conv_addr_write_o,
			acc_addr_read_o => acc_map_addr_s 
	);

	-- Activation & Pooling Controller
	I_ActivControl: entity work.ActivControl
	Port map( 
			clk				=> clk,
			start_i			=> start_fire_i,
			block_size_i	=> block_size_i,
			block_width_i	=> block_width_i,
			pool_mode_i		=> pool_mode_i,
			actv_index_i	=> input_index_i,
			en_fire_o		=> en_fire_o,
			---------------
			addr_write_o	=> fire_addr_write_o,
			addr_read_o		=> fire_map_addr_s 
	);

	-- Store Controller
	I_StoreControl: entity work.StoreControl
	Port map( 
			clk				=> clk,
			start_i			=> start_store_i,
			block_size_i	=> block_size_i,
			store_index_i	=> store_index_i,
			en_store_o		=> en_store_o,
			---------------
			addr_write_o	=> store_addr_write_o,
			addr_read_o		=> store_map_addr_s
	);

	-- multiplex the acess to the feature buffers
	map_addr_read_o <= acc_map_addr_s or fire_map_addr_s or store_map_addr_s when rising_edge(clk); --HERE
	-- map_addr_read_o <= std_logic_vector(unsigned(acc_map_addr_s or fire_map_addr_s or store_map_addr_s)+1) when rising_edge(clk);

end behavioral;
