----------------------------------------------------------------------------------
-- Engineer: B.Halimi
-- Description: Receiver
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Receiver is
	generic (PAYLOAD : integer);
	port (
		ifclk			: in std_logic;
		-------------------------------
		FLAGA			: in std_logic;
		SLOE 			: out std_logic;
		SLRD 			: out std_logic;
		-------------------------------
		start_i			: in std_logic;
		en_wr_o			: out std_logic;
		idle_rx_o		: out std_logic;
		addr_rx_o		: out std_logic_vector(15 downto 0)
	);
end Receiver;

architecture Behavioral of Receiver is

	type rx_enum 			is (idle,halt,run);
	signal state_s			: rx_enum := idle;	
	signal cnt_s			: unsigned(16 downto 0);
	signal empty_s			: std_logic;
	signal en_wr_s			: std_logic;

begin

	-- control FIFO read port (active low)
	SLRD <= '0' when (state_s = run) else '1';
	SLOE <= not(FLAGA) when rising_edge(ifclk);
	
	-- register the 'empty' flag
	empty_s <= not(FLAGA) when rising_edge(ifclk);

	-- control FPGA buffer write port
	addr_rx_o <= std_logic_vector(cnt_s(15 downto 0));
	en_wr_s <= '1' when (state_s = run and empty_s = '0') else '0';
	en_wr_o <= en_wr_s when rising_edge(ifclk);
	
	-- activity probe
	idle_rx_o <= '1' when (state_s = idle) else '0';

	p_send: process(ifclk)
	begin
		if rising_edge(ifclk) then
		
			-- Receive FSM (Moore) --
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
					elsif empty_s = '0' then	
						state_s <= run;			
					else								
						state_s <= halt;			
					end if;							
					-------
					if empty_s = '0' then
						cnt_s <= cnt_s+1;
					else					
						cnt_s <= cnt_s-1;
					end if;
					
				when halt =>
					if empty_s = '1' then 
						state_s <= halt;
					else 
						state_s <= run;
					end if;
					-------

			end case;
			
		end if;
		
	end process p_send;

end Behavioral;

