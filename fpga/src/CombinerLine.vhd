----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Additional Comments: 
-- Uni-dimentional filter, used a building block of our Convolution Unit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CombinerLine is
	Generic ( 
		W	: natural; 
		D	: natural; 
		Fp	: natural);
	Port (
		clk			: in std_logic;
		en_weight_i	: in std_logic;
		weight_i	: in std_logic_vector(W-1 downto 0);
		weight_o	: out std_logic_vector(W-1 downto 0);
		data_i		: in std_logic_vector(W-1 downto 0);
		-- accumulation chain
		heap_i		: in std_logic_vector(W-1 downto 0);
		heap_o		: out std_logic_vector(W-1 downto 0)
	);	
end CombinerLine;

architecture dataflow of CombinerLine is

	type vector_array_simple is array (0 to D-1) of std_logic_vector(W-1 downto 0);
	signal weight_array_s : vector_array_simple;
	
	type vector_array_wide is array (0 to D-1) of std_logic_vector(47 downto 0);
	signal heap_array_s : vector_array_wide;
	
	signal data_r		: std_logic_vector(W-1 downto 0);
	signal heap_out_s	: std_logic_vector(47 downto 0);

begin

	-- First combiner 
	heap_array_s(0) <= (47-W-Fp downto 0 => '0') & heap_i & (Fp-1 downto 0 => '0');
	weight_array_s(0) <= weight_i;

	I_first_combiner: entity work.Combiner
	Generic map(W => W)
	Port map( 
		clk			=> clk,
		data_i		=> data_r,
		-- Weight
		en_weight_i => en_weight_i,
		weight_i	=> weight_array_s(0),
		weight_o	=> weight_array_s(1),
		-- Heap
		heap_i		=> heap_array_s(0),
		heap_c_o	=> heap_array_s(1),
		heap_o		=> open
	);

	-- Mid combiners assembly
	G_Assembly: for k in 1 to D-2 generate

		I_combiner_k: entity work.CombinerPC
		Generic map(W => W)
		Port map( 
			clk			=> clk,
			data_i		=> data_r,
			-- Weight
			en_weight_i => en_weight_i,
			weight_i	=> weight_array_s(k),
			weight_o	=> weight_array_s(k+1),
			-- Heap
			heap_c_i	=> heap_array_s(k),
			heap_c_o	=> heap_array_s(k+1),
			heap_o		=> open
		);
		
	end generate G_Assembly;

	-- Last combiner
	I_last_combiner: entity work.CombinerPC
	Generic map(W => W)
	Port map( 
		clk			=> clk,
		data_i		=> data_r,
		-- Weight
		en_weight_i	=> en_weight_i,
		weight_i	=> weight_array_s(D-1),
		weight_o	=> weight_o,
		-- Heap
		heap_c_i	=> heap_array_s(D-1),
		heap_c_o	=> open,
		heap_o		=> heap_out_s
	);

	-- Register I/Os
	P_latch: process (clk) is
	begin
		if rising_edge(clk) then
			data_r <= data_i;
			heap_o <= heap_out_s(W+Fp-1 downto Fp);
		end if;
	end process;

end dataflow;

