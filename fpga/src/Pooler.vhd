----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: Max-pooling Unit
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pooler is
	Generic (W : natural);
	Port ( 
		clk			: in std_logic;
		sync_i		: in std_logic;
		data_i		: in  std_logic_vector (W-1 downto 0);
		data_o		: out std_logic_vector (W-1 downto 0)
	);
end Pooler;

architecture behavioral of Pooler is

	signal sync_s			: std_logic;
	signal state_counter_s	: std_logic_vector(1 downto 0);
	signal reg_value_s		: std_logic_vector(W-1 downto 0);

begin

	P_MaxPool: process(clk) 
	begin
		if rising_edge(clk) then
		
			-- perform the cyclic comparisons 
			if state_counter_s = "00" then
				reg_value_s <= data_i;
				data_o <= reg_value_s;
			else
				if signed(data_i) > signed(reg_value_s) then
						reg_value_s <= data_i;
				end if;
			end if;
			
			-- manage the pooling cycle
			if sync_s = '1' then
				state_counter_s <= std_logic_vector(unsigned(state_counter_s) + 1);
			else
				state_counter_s <= "00"; -- This value is used to define the synchronization (01)
			end if;
			
			sync_s <= sync_i;
			
		end if;
	end process;

end behavioral;

