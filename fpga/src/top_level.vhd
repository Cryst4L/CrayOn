-------------------------------------------------------------------------------------
-- Engineer: Benjamin D. Halimi
-- Description: Ultra-Low latency image analyzer based on Convolutional Neural 
-- Networks (ConvNets) and it's High Speed USB interface towards an Host computer.
--
-- Version 1.9: Upgraded the representation for Qm(5.8)-Qp(5d8) to Qm(6.8)-Qp(4.10)
-------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
	
entity top_level is
	port (
		-- clks
		ifclk		: in std_logic;
		fxclk		: in std_logic; 
		-- gpios
		reset		: in std_logic;
		start		: in std_logic;
		MODE		: in std_logic;
		RUN			: in std_logic;
		REQA		: in std_logic;
		REQB		: in std_logic;
		REQC		: in std_logic;
		REQD		: in std_logic;
		-- fx2-lp
		fd			: inout std_logic_vector(15 downto 0);
		SLWR		: out std_logic;
		SLRD		: out std_logic;
		SLOE		: out std_logic;
		FIFOADDR0	: out std_logic;
		FIFOADDR1	: out std_logic;
		PKTEND		: out std_logic;
		FLAGA		: in std_logic;
		FLAGB		: in std_logic
	);
end top_level;

architecture behavioral of top_level is

	-- clocking
	signal fxclkb 		: std_logic := '0';
	signal ifclkb 		: std_logic := '0';
	
	-- read input buffer
	signal in_addr_s	: std_logic_vector(16 downto 0);
	signal in_data_s	: std_logic_vector(7 downto 0);
	
	-- store in the buffer
	signal out_en_s		: std_logic;
	signal out_addr_s	: std_logic_vector(16 downto 0);
	signal out_data_s 	: std_logic_vector(7 downto 0);
	
	-- merge i/o addresses
	signal inout_addr_s	: std_logic_vector(16 downto 0);

	-- synchronize
	signal rx_busy_s 	: std_logic := '1';
	signal run_s		: std_logic := '0';
	signal request_s	: std_logic_vector(3 downto 0);

begin

	-- Clocking	
	I_clk_manager : entity work.clk_manager
	Port map (I	=> fxclk, O	=> fxclkb);

	I_mmcme: entity work.mmcme
	Generic map (PHI => 0.0)
	Port map (I	=> ifclk, O	=> ifclkb);

	-- USB-RX-TX
	I_Transceiver : entity work.Transceiver
	port map (
			-- fx2lp fifos  
			ifclk		=> ifclkb,
			fd			=> fd,
			SLWR		=> SLWR,
			SLRD		=> SLRD,     
			SLOE		=> SLOE,
			FIFOADDR0	=> FIFOADDR0, 
			FIFOADDR1	=> FIFOADDR1,
			PKTEND		=> PKTEND,
			FLAGA		=> FLAGA,     
			FLAGB		=> FLAGB,
			-- fpga i/o
			reset		=> reset,
			start		=> start,
			MODE		=> MODE,			
			-- user read / write
			usrclk		=> fxclkb,
			en_wr_i		=> out_en_s,
			address_i	=> inout_addr_s,		
			data_wr_i	=> out_data_s,
			data_rd_o	=> in_data_s,		
			-- activity probes
			rx_busy_o	=> rx_busy_s,
			tx_busy_o	=> open
	);
	
	-- StreamNet IP
	I_CrayOn: entity work.CrayOn
	Generic map( 
		VL	=> 8,	-- ALU width HERE 8
		D	=> 9,	-- convolution array dim.
		W	=> 14,	-- arith. precision
		Fm	=> 8,	-- fractional part - map values
		Fp	=> 10,	-- fractional part - parameters
		Wi	=> 8)	-- input precision
	Port map(
		clk			=> fxclkb,
		-- synchronize
		start_i		=> run_s,
		request_i	=> request_s, --HERE
		-- read inputs
		ib_addr_o	=> in_addr_s,
		ib_data_i	=> in_data_s,
		-- store results
		rb_en_o		=> out_en_s,
		rb_addr_o	=> out_addr_s,
		rb_data_o	=> out_data_s
	);

	run_s <= RUN when rising_edge(fxclkb);
	request_s <= REQD & REQC & REQB & REQA;
	inout_addr_s <= out_addr_s when (out_en_s = '1') else in_addr_s;

end behavioral;