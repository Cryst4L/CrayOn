----------------------------------------------------------------------------------
-- Engineer: B.Halimi
-- Description: Probe the Transceiver activity, requiring a clock domain crossing
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Probe is
	port (
		-- from the transceiver
		ifclk		: in std_logic;
		idle_rx_i	: in std_logic;
		idle_tx_i	: in std_logic;
		-- to the user IP
		usrclk		: in std_logic;
		rx_busy_o   : out std_logic; 
		tx_busy_o	: out std_logic
	);
end Probe;

architecture behavioral of Probe is

	signal idle_rx_s	: std_logic;
	signal rx_busy_s	: std_logic;
	
	signal idle_tx_s	: std_logic;
	signal tx_busy_s	: std_logic;

begin

	-- rx activity probing
	idle_rx_s <= idle_rx_i when rising_edge(ifclk);
	rx_busy_s <= not(idle_rx_s) when rising_edge(usrclk);
	rx_busy_o <= rx_busy_s when rising_edge(usrclk);
	
	-- tx activity probing
	idle_tx_s <= idle_tx_i when rising_edge(ifclk);
	tx_busy_s <= not(idle_tx_s) when rising_edge(usrclk);
	tx_busy_o <= tx_busy_s when rising_edge(usrclk);

end behavioral;

