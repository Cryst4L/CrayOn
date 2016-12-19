----------------------------------------------------------------------------------
-- Engineer: B. Halimi 
-- Description: Clock filter based on a MMCME component
---------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
library unisim;
use unisim.vcomponents.all;

entity mmcme is
	generic( 
		PHI : real -- phase
	); 
	port(
		I : in std_logic;
		O : out std_logic
	);

end mmcme;

architecture behavioral of mmcme is

signal clk_in		: std_logic;
signal clk_fb_in	: std_logic;
signal clk_fb_out	: std_logic;
signal clk_out		: std_logic;
signal locked		: std_logic;

begin
    
	in_buf : IBUFG 
	port map (
		I => I,
		O => clk_in
	);

	inst_mmcme : MMCME2_BASE
	generic map (
		BANDWIDTH			=> "OPTIMIZED",
		CLKFBOUT_MULT_F		=> 20.0,
		CLKFBOUT_PHASE		=> 0.0,
		CLKIN1_PERIOD		=> 0.0,
		CLKOUT0_DIVIDE_F	=> 20.0, 
		CLKOUT1_DIVIDE		=> 1,
		CLKOUT2_DIVIDE		=> 1,
		CLKOUT3_DIVIDE		=> 1,
		CLKOUT4_DIVIDE		=> 1,
		CLKOUT5_DIVIDE		=> 1,
		CLKOUT0_DUTY_CYCLE	=> 0.5,
		CLKOUT1_DUTY_CYCLE	=> 0.5,
		CLKOUT2_DUTY_CYCLE	=> 0.5,
		CLKOUT3_DUTY_CYCLE	=> 0.5,
		CLKOUT4_DUTY_CYCLE	=> 0.5,
		CLKOUT5_DUTY_CYCLE	=> 0.5,
		CLKOUT0_PHASE		=> PHI,
		CLKOUT1_PHASE		=> 0.0,
		CLKOUT2_PHASE		=> 0.0,
		CLKOUT3_PHASE		=> 0.0,
		CLKOUT4_PHASE		=> 0.0,
		CLKOUT5_PHASE		=> 0.0,
		CLKOUT4_CASCADE		=> FALSE, 
		DIVCLK_DIVIDE		=> 1,
		REF_JITTER1			=> 0.0,
		STARTUP_WAIT		=> FALSE
	) 
	port map (
		CLKIN1		=> clk_in,
		CLKOUT0		=> clk_out,
		PWRDWN		=> '0',
		RST			=> '0',
		CLKFBIN		=> clk_fb_in,
		CLKFBOUT	=> clk_fb_out,
		LOCKED		=> locked
	);

	fb_buf : BUFG
	port map (
		I => clk_fb_out,
		O => clk_fb_in
	); 

	out_buf : BUFG
	port map (
		I => clk_out,
		O => O
	); 

end behavioral;

