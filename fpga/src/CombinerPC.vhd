----------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: 
-- Unit very similar to the standard Combiner but using PCin  
-- in case of C to feed the heap input
----------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CombinerPC is
	Generic ( W : natural ); 
	Port (
		clk : in std_logic;
		data_i : in std_logic_vector(W-1 downto 0);
		-- weight line
		en_weight_i : in std_logic;
		weight_i : in std_logic_vector(W-1 downto 0);
		weight_o : out std_logic_vector(W-1 downto 0);
		-- accumulation chain
		heap_c_i : in std_logic_vector(47 downto 0);
		heap_c_o : out std_logic_vector(47 downto 0);
		heap_o : out std_logic_vector(47 downto 0)
	);	
end CombinerPC;

architecture Behavioral of CombinerPC is

	signal weight_s : std_logic_vector(W-1 downto 0);

begin

	-- Latch the weight
	weight_s <= weight_i when (rising_edge(clk) and en_weight_i = '1');
	weight_o <= weight_s;

	-- Combine the weight and the data
	I_madd_pc: entity work.madd_pc
	Port map( 
			clk		=> clk,
			a		=> data_i,
			b		=> weight_s,
			pcin	=> heap_c_i,
			pcout	=> heap_c_o,
			p		=> heap_o
	);

end Behavioral;
