----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description:
-- Simple ram-based delay line used a line buffer inside our convolution unit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DelayLine is
	Generic ( W : natural); 
    Port ( 
		clk		: in  std_logic;
		size_i	: in  std_logic_vector(8 downto 0);
		d_i	: in  std_logic_vector(W-1 downto 0);
		q_o	: out  std_logic_vector(W-1 downto 0)
	);
end DelayLine;

architecture behavioral of DelayLine is

	signal size_s : std_logic_vector(8 downto 0);
	signal true_s : std_logic;

begin

	size_s <= size_i when rising_edge(clk);

	I_bram_line: entity work.bram_line
	Port map(
		clk	=> clk,
		a	=> size_s,
		d	=> d_i,
		q	=> q_o 
	);
	  
end behavioral;

