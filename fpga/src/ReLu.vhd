----------------------------------------------------------------------------------
-- Engineer: B. Halimi
-- Additional Comments: Rectified Linear Unit, with configurable delay
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ReLu is
	Generic( 
		W	: natural;
		DL	: natural);
	Port (
		clk 	: in  std_logic;
		data_i 	: in std_logic_vector(W-1 downto 0);
		data_o 	: out  std_logic_vector(W-1 downto 0)
	);
end ReLu;

architecture behavioral of ReLu is

	type line_t is array(0 to DL-2) of std_logic_vector(W-1 downto 0);
	signal line_s : line_t;
	
	signal result_s : std_logic_vector(W-1 downto 0);

begin

	P_ReLu: process(clk)
	begin
		if rising_edge(clk) then
		
			-- input buffering (for synchronization purpose)
			line_s(0 to line_s'high-1) <= line_s(1 to line_s'high);
			line_s(line_s'high) <= data_i;

			-- rectification
			if signed(line_s(0)) > 0 then
				result_s <= line_s(0);		
			else 
				result_s <= (others => '0');
			end if;
			
		end if;
	end process;
	
	data_o <= result_s;
	
end behavioral;
