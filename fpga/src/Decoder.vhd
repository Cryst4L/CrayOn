----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: Decode the received interruptions
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Decoder is
	Port (
		clk					: in std_logic;
		start_i				: in std_logic;
		request_i			: in std_logic_vector(3 downto 0);
		------------------------------------
		propagate_o			: out std_logic;
		load_kernel_o		: out std_logic;
		load_program_o		: out std_logic;
		request_config_o	: out std_logic_vector(1 downto 0)
	);	
end Decoder;

architecture behavioral of Decoder is

	signal index_s			: std_logic_vector(1 downto 0);
	signal state_s			: std_logic_vector(2 downto 0);
	signal state_r			: std_logic_vector(2 downto 0);
	
begin

	index_s <= request_i(1 downto 0);

	P_decode : process(clk)
	begin
		if rising_edge(clk) then
			
			if start_i = '1' then
				-- decode the request
				if (index_s = "00") then
					state_s <= "001";
				elsif (index_s = "01") then
					state_s <= "010";
				elsif (index_s = "10") then
					state_s <= "100";
				else
					state_s <= "000";
				end if;
				-- clear the register
				state_r <= (others => '0');
			else
				-- assert the register
				state_r <= state_s;
			end if;
		end if;
	end process;
	
	propagate_o <= state_r(0);
	load_kernel_o <= state_r(1);
	load_program_o <= state_r(2);
	
	request_config_o <= request_i(3 downto 2) when rising_edge(clk);
	
end behavioral;