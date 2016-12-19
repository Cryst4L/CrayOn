----------------------------------------------------------------------------------
-- Engineer: B. Halimi
-- Description: 
-- A usb interface for the FX2LP, based a buffered architecture. It consist of 
-- transmitter and a receiver holding both their own memory buffer and an external 
-- user port to read and write in them. Synchronisation is handled by the Host and  
-- is aimed to be seamless for the user of this HDL entity. 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.all;

entity Transceiver is
	port (
		-- fx2-lp fifos  
		ifclk		: in std_logic;
		fd			: inout std_logic_vector(15 downto 0);
		SLWR		: out std_logic;
		SLRD		: out std_logic;
		SLOE		: out std_logic;
		FIFOADDR0	: out std_logic;
		FIFOADDR1	: out std_logic;
		PKTEND		: out std_logic;
		FLAGA		: in std_logic;
		FLAGB		: in std_logic;
		-- fpga i/os
		reset		: in std_logic;
		start		: in std_logic;
		MODE		: in std_logic;
		-- user read/write
		usrclk		: in std_logic;
		en_wr_i		: in std_logic;
		address_i	: in std_logic_vector(16 downto 0);
		data_wr_i	: in std_logic_vector(7 downto 0);
		data_rd_o	: out std_logic_vector(7 downto 0);
		-- activity probes
		rx_busy_o	: out std_logic;
		tx_busy_o	: out std_logic
	);
end Transceiver;

architecture behavioral of Transceiver is

	--signal declaration;
	signal start_rx_s	: std_logic := '0';
	signal idle_rx_s	: std_logic := '0';
	signal data_rx_s	: std_logic_vector(15 downto 0);
	signal addr_rx_s	: std_logic_vector(15 downto 0);
	signal en_wr_s		: std_logic := '0';
	
	signal start_tx_s	: std_logic := '0';
	signal idle_tx_s	: std_logic := '0';
	signal data_tx_s	: std_logic_vector(15 downto 0);
	signal addr_tx_s	: std_logic_vector(15 downto 0);
	
	signal addr_rxtx_s	: std_logic_vector(15 downto 0);
	signal usr_wr_s		: std_logic;

begin

	PKTEND <= '1';
	
	-- Dual Port Memory
	Memory : entity work.rxtx_ram
	port map (
		-- transceiver port (A)
		wea		=> (others => en_wr_s),
		addra	=> addr_rxtx_s,
		dina	=> data_rx_s,
		douta	=> data_tx_s,
		clka	=> ifclk,
		-- user port (B)
		web		=> (others => usr_wr_s), -- HERE !
		addrb	=> address_i,
		dinb	=> data_wr_i,
		doutb	=> data_rd_o,
		clkb	=> usrclk
	);
	
	-- Reception Unit
	Receiver : entity work.Receiver
	generic map (PAYLOAD => 38400)
	port map (
		-- RAM -> HOST
		ifclk			=> ifclk,
		--------------------------
		FLAGA			=> FLAGA,
		SLOE 			=> SLOE,
		SLRD 			=> SLRD,
		--------------------------
		start_i			=> start_rx_s,
		en_wr_o			=> en_wr_s,
		addr_rx_o		=> addr_rx_s,
		idle_rx_o		=> idle_rx_s
	);

	-- Transmission Unit
	Transmitter : entity work.Transmitter
	generic map (PAYLOAD => 7680) -- 38400
	port map (
		-- RAM -> HOST
		ifclk			=> ifclk,
		--------------------------
		FLAGB			=> FLAGB,
		SLWR			=> SLWR,
		--------------------------
		start_i			=> start_tx_s,
		addr_tx_o		=> addr_tx_s,
		idle_tx_o		=> idle_tx_s
	);
	
	-- Activity Probing Unit
	Probe : entity work.Probe
	port map (
		-- from the receiver
		ifclk => ifclk,
		idle_rx_i => idle_rx_s,
		idle_tx_i => idle_tx_s,
		-- to the user IP
		usrclk => usrclk,
		rx_busy_o => rx_busy_o,
		tx_busy_o => tx_busy_o
	);
	
	-- Merge rx and tx addresses
	addr_rxtx_s <= addr_rx_s when (MODE = '0') else addr_tx_s;
	
	-- Prevent a write during a rx transfer
	usr_wr_s <= en_wr_i and idle_rx_s;
	
	p_assign: process(ifclk)
	begin
		if rising_edge(ifclk) then
		
			start_tx_s <= start and MODE;
			start_rx_s <= start and not(MODE);
		
			if MODE = '0' then
				-- RX EP = 6
				FIFOADDR0 <= '0';
				FIFOADDR1 <= '1';	
				fd <= (others => 'Z');
				data_rx_s <= fd;
			else
				-- TX EP = 2
				FIFOADDR0 <= '0';
				FIFOADDR1 <= '0'; 	
				fd <= data_tx_s;
			end if;
		
		end if;
	end process;

end behavioral;
