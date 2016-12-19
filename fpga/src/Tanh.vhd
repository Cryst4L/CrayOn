----------------------------------------------------------------------------------
-- Engineer: B. Halimi
-- Description: Piece-wise linear approximator of the hyperbolic tangent function
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Tanh is
	Generic( 
		W	: natural;
		Fm	: natural);
	Port(
		clk		: in std_logic;
		data_i	: in std_logic_vector(W-1 downto 0);
		data_o	: out std_logic_vector(W-1 downto 0)
	);
end entity;

architecture structural of Tanh is

	signal msb_s		: std_logic_vector(9 downto 0) := (others => '0');
	signal msb_r		: std_logic_vector(9 downto 0) := (others => '0');

	signal lsb_s		: std_logic_vector(9 downto 0) := (others => '0');
	signal lsb_r		: std_logic_vector(9 downto 0) := (others => '0');
	signal lsb_b_r		: std_logic_vector(9 downto 0) := (others => '0');

	signal offset_s		: std_logic_vector(19 downto 0) := (others => '0');
	signal offset_r		: std_logic_vector(19 downto 0) := (others => '0');
	signal offset_b_r	: std_logic_vector(19 downto 0) := (others => '0');

	signal slope_s		: std_logic_vector(19 downto 0) := (others => '0');
	signal slope_r		: std_logic_vector(19 downto 0) := (others => '0');

	signal product_s	: signed(30 downto 0) := (others => '0');

	signal result_s		: signed(19 downto 0) := (others => '0');
	signal result_r		: signed(19 downto 0) := (others => '0');

begin

	msb_s <= (19 downto (12+W-Fm) => data_i(W-1)) & data_i(W-1 downto Fm-2);
	lsb_s <= data_i(Fm-3 downto 0) & (11-Fm downto 0 => '0');

	I_OffsetTable: entity work.OffsetTable
	Port map (
		addr_i => msb_r,
		data_o => offset_s
	);

	I_SlopeTable: entity work.SlopeTable
	Port map (
		addr_i => msb_r,
		data_o => slope_s
	);
	
	P_look_n_multiply : process(clk)
	begin
		if rising_edge(clk) then
		
			-- 1st register line
			msb_r <= msb_s;
			lsb_r <= lsb_s;

			-- 2nd register line
			lsb_b_r <= lsb_r;
			slope_r <= slope_s;
			offset_r <= offset_s;
			
			-- 3rd register line
			offset_b_r <= offset_r;
			product_s <= signed(slope_r) * signed("0" & lsb_b_r);

			-- 4th register line
			result_s <= signed(offset_b_r) + signed(product_s(30 downto 12)); 

		end if;
	end process;
	
	data_o <= std_logic_vector(result_s(W+11-Fm downto 12-Fm));

end architecture;
