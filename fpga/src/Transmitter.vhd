----------------------------------------------------------------------------------
-- Engineer: B.Halimi
-- Description: Transmitter
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Transmitter is
	generic (PAYLOAD : integer);
	port (
		ifclk			: in std_logic;
		-------------------------------
		FLAGB			: in std_logic;
		SLWR			: out std_logic;
		-------------------------------
		start_i			: in std_logic;
		en_tx_o			: out std_logic;
		idle_tx_o		: out std_logic;
		addr_tx_o		: out std_logic_vector(15 downto 0)
	);
end Transmitter;

architecture behavioral of Transmitter is

	type tx_enum is (idle,halt,run);
	signal state_s	: tx_enum := idle;
	signal cnt_s	: unsigned(16 downto 0);
	signal en_tx_s	: std_logic;
	signal full_s	: std_logic;

begin

	-- register the 'full' flag
	full_s <= not(FLAGB) when rising_edge(ifclk);
			
	-- enable the transmission
	SLWR <= not(en_tx_s) when rising_edge(ifclk);
	
	-- write address in the FPGA buffer
	addr_tx_o <= std_logic_vector(cnt_s(15 downto 0));
	
	-- activity probe
	idle_tx_o <= '1' when (state_s = idle) else '0';

	p_send: process(ifclk)
	begin
		if rising_edge(ifclk) then
			
			-- Transceive FSM (Moore) --
			case state_s is
			
				when idle => 
					if start_i = '1' then 
						state_s <= run;
					else
						state_s <= idle;
					end if;
					-------
					cnt_s <= (others => '0');
				
				when run =>
					if cnt_s = (PAYLOAD-1) then
						state_s <= idle;
					elsif full_s = '0' then
						state_s <= run;
					else
						state_s <= halt;
					end if;
					-------
					if full_s = '0' then
						cnt_s <= cnt_s+1;
					else
						cnt_s <= cnt_s-3;
					end if;
					
				when halt =>
					if full_s = '1' then 
						state_s <= halt;
					else
						state_s <= run;
					end if;
					-------
			end case;
			
			-- Transmission status
			if (state_s = run and full_s = '0') then
				en_tx_s <= '1';
			else
				en_tx_s <= '0';
			end if;

		end if;
	end process p_send;
	

end behavioral;

