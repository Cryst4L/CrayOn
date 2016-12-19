----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description:
-- Controller of the convolution instruction
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ConvControl is
	Port (  clk 			: in std_logic;
			start_i			: in std_logic;
			block_size_i	: in std_logic_vector(16 downto 0);
			input_index_i	: in std_logic_vector(3 downto 0);
			output_index_i	: in std_logic_vector(3 downto 0);
			en_conv_o		: out std_logic;
			----------------
			addr_read_o		: out std_logic_vector(16 downto 0);
			addr_write_o	: out std_logic_vector(16 downto 0);
			acc_addr_read_o	: out std_logic_vector(16 downto 0)
	);
end ConvControl;

architecture behavioral of ConvControl is

	constant delay_read		: natural := 11;
	constant delay_write	: natural := 17;

	signal block_size_s		: unsigned(16 downto 0);
	signal start_s			: std_logic := '0';

	signal input_offset_s	: unsigned(20 downto 0);
	signal output_offset_s	: unsigned(20 downto 0);
	
	signal input_addr_s		: unsigned(16 downto 0);
	signal output_addr_s	: unsigned(16 downto 0);
	
	signal input_addr_r		: unsigned(16 downto 0);
	signal output_addr_r	: unsigned(16 downto 0);
	
	signal flag_s			: std_logic := '0';
	signal counter_s		: unsigned(16 downto 0);
	signal addr_read_s 		: unsigned(16 downto 0);
	signal addr_write_s 	: unsigned(16 downto 0);
	signal acc_addr_read_s 	: unsigned(16 downto 0);
	signal en_conv_s		: std_logic := '0';

begin

	P_ctrl: process(clk)
	begin
		if rising_edge(clk) then
		
			if start_i = '1' and start_s = '0' and flag_s = '0' then
				flag_s <= '1';
				counter_s <= (others => '0');
				input_addr_s <= input_offset_s(16 downto 0);
				output_addr_s <= output_offset_s(16 downto 0);					
				
			elsif flag_s = '1' then
				if counter_s = block_size_s then  
					flag_s <= '0';
				else 
					counter_s <= counter_s + 1;
					input_addr_s <= input_addr_s + 1;
					output_addr_s <= output_addr_s + 1;
				end if;
			end if;
			
			input_offset_s <= unsigned(input_index_i) * block_size_s;
			output_offset_s <= unsigned(output_index_i) * block_size_s;
			
			input_addr_r <= input_addr_s;
			output_addr_r <= output_addr_s; 
			
		end if;
	end process;
	
	P_reg: process(clk)
	begin
		if rising_edge(clk) then
		
			start_s <= start_i;
			block_size_s <= unsigned(block_size_i);
			
			addr_read_o <= std_logic_vector(addr_read_s);
			addr_write_o <= std_logic_vector(addr_write_s);
			acc_addr_read_o <= std_logic_vector(acc_addr_read_s);
			en_conv_o <= en_conv_s;
			
		end if;
	end process;
				
	P_out: process(clk)
	begin
		if rising_edge(clk) then
		
			if (flag_s = '1') then
				en_conv_s <= '1';
				addr_read_s <= input_addr_r; 
				addr_write_s <= output_addr_r - delay_write;
				acc_addr_read_s <= output_addr_r - delay_read;
			else
				en_conv_s <= '0';
				addr_read_s <= (others => '0');
				addr_write_s <= (others => '0');
				acc_addr_read_s <= (others => '0');
			end if;		
			
		end if;
	end process;

end Behavioral;

