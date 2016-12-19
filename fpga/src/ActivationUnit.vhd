----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: Activation and Pooling Unit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ActivationUnit  is
	Generic (W : natural; Fm : natural);
	Port ( 
		clk				: in std_logic;
		sync_i			: in std_logic;
		pool_mode_i		: in std_logic;
		rect_mode_i		: in std_logic_vector(2 downto 0);
		data_i			: in  std_logic_vector (W-1 downto 0);
		data_o			: out std_logic_vector (W-1 downto 0)
	);
end ActivationUnit;

architecture behavioral of ActivationUnit  is

	-- activation delay
	constant DL			: natural := 4;
	
	-- copy delay line
	type line_t is array(0 to DL-2) of std_logic_vector(W-1 downto 0);
	signal line_s		: line_t;

	-- activation results
	signal copy_out_s	: std_logic_vector(W-1 downto 0);
	signal relu_out_s	: std_logic_vector(W-1 downto 0);
	signal tanh_out_s	: std_logic_vector(W-1 downto 0);

	-- max-pooling signals
	signal rectified_s	: std_logic_vector(W-1 downto 0);
	signal max_pooled_s	: std_logic_vector(W-1 downto 0);

begin
	
	----------- Activation Function ------------
	
	-- Rectified Linear Unit
	I_ReLu: entity work.ReLu
	Generic map(W => W, DL => DL)
	Port map (
		clk 	=> clk,
		data_i	=> data_i,
		data_o	=> relu_out_s
	);

	-- Hyperbolic Tangent
	I_Tanh: entity work.Tanh
	Generic map(W => W, Fm => Fm)
	Port map (
		clk 	=> clk,
		data_i	=> data_i,
		data_o	=> tanh_out_s
	);
	
	-- Delayed Copy (linear output)
	P_copy: process(clk)
	begin
		if rising_edge(clk) then
			line_s(0 to line_s'high-1) <= line_s(1 to line_s'high);
			line_s(line_s'high) <= data_i;
			copy_out_s <= line_s(0);
		end if;
	end process;

	-- multiplexing (registered)
	P_mux: process(clk)
	begin
		if rising_edge(clk) then
			case rect_mode_i is
				when "000" => rectified_s <= copy_out_s;
				when "001" => rectified_s <= relu_out_s;
				when "010" => rectified_s <= tanh_out_s;
				when others => rectified_s <= (others => '-');
			end case;
		end if;
	end process;

	-------------- Max Pooling ---------------	
			
	-- Pooling unit
	I_Pooler: entity work.Pooler
	Generic map(W => W)
	Port map (
		clk 	=> clk,
		sync_i	=> sync_i,
		data_i	=> rectified_s,
		data_o	=> max_pooled_s
	);
		
	data_o <= max_pooled_s when (pool_mode_i = '1') else rectified_s;

end behavioral;

