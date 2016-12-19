----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description:
-- Top level of our fully parallelized, fully pipelined convolution unit.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ConvolutionUnit is
	Generic (
		W  : natural;
		Fp : natural;
		Fm : natural;
		D  : natural);
	Port ( 
		clk					: in std_logic;
		block_width_i		: in std_logic_vector(8 downto 0);
		-- Push Kernel
		en_push_kernel_i	: in std_logic; 
		kernel_i			: in std_logic_vector(W-1 downto 0);
		kernel_o			: out std_logic_vector(W-1 downto 0);
		-- Convolution
		conv_data_i			: in std_logic_vector(W-1 downto 0);
		acc_data_i			: in std_logic_vector(W-1 downto 0);
		conv_data_o			: out std_logic_vector(W-1 downto 0)
	);
end ConvolutionUnit;

architecture dataflow of ConvolutionUnit is

	signal fifo_size_s		: std_logic_vector(8 downto 0);
	signal bias_s			: std_logic_vector(W-1 downto 0);
	signal conv_data_s		: std_logic_vector(W-1 downto 0);
	signal en_weight_s		: std_logic := '0';

	type bridge is array (0 to D) of std_logic_vector(W-1 downto 0);
	signal heap_array_s		: bridge; 
	signal heap_array_d_s	: bridge;
	signal weight_array_s	: bridge; 

begin

	-- Bias
	weight_array_s(0) <= bias_s;
	bias_s <= kernel_i when (rising_edge(clk) and en_weight_s = '1');

	-- Instantiate the Convolution Array
	G_Combiners: for k in 0 to D-1 generate
	
		I_CombinerLine_k : entity work.CombinerLine
		Generic map(W => W, Fp => Fp, D => D)
		Port map (
			clk			=> clk,
			data_i		=> conv_data_i,
			-- Weight line
			en_weight_i	=> en_weight_s,
			weight_i	=> weight_array_s(k),
			weight_o	=> weight_array_s(k+1),
			-- Heap line
			heap_i		=> heap_array_d_s(k), 
			heap_o		=> heap_array_s(k+1)
		);
		
	end generate G_Combiners;

	-- Instantiate the Block-Rams
	G_DelayLines: for k in 0 to D-2 generate
	
		I_DelayLine_k: entity work.DelayLine 
		Generic map(W => W)
		 Port map (
			clk		=> clk,
			size_i	=> fifo_size_s,
			d_i		=> heap_array_s(k+1),
			q_o		=> heap_array_d_s(k+1)
		);
		
	end generate G_DelayLines;

	kernel_o <= weight_array_s(D);
	conv_data_s <= std_logic_vector(signed(heap_array_s(D)) + signed(acc_data_i)) when rising_edge(clk);

	-- Latch I/Os
	P_latch: process (clk) is
	begin
		if rising_edge(clk) then
		
			en_weight_s <= en_push_kernel_i;
			fifo_size_s <= std_logic_vector(unsigned(block_width_i) - (D+8)); 
			heap_array_d_s(0) <= (W-1 downto W+Fm-Fp => bias_s(W-1)) & bias_s(W-1 downto Fp-Fm); --HERE!
			conv_data_o <= conv_data_s;
			
		end if;
	end process;

end dataflow;

