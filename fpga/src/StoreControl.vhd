----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: Controller of the store instruction
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity StoreControl is
	Port (  clk				: in  std_logic;
			start_i			: in  std_logic;
			block_size_i	: in std_logic_vector (16 downto 0);
			store_index_i	: in std_logic_vector (7 downto 0);
			en_store_o		: out  std_logic;
			----------------
			addr_write_o	: out  std_logic_vector (16 downto 0);
			addr_read_o		: out  std_logic_vector (16 downto 0)
	);
end StoreControl;

architecture Behavioral of StoreControl is

	constant delay			: natural := 8;
	
	type enum is (init, init_addr, run, idle);
	signal state			: enum := idle;

	signal start_s			: std_logic := '0';
	signal store_index_s	: unsigned(7 downto 0);
	signal block_size_s		: unsigned(16 downto 0);
	signal pre_addr_s		: unsigned(20 downto 0);
	signal addr_read_s		: unsigned(16 downto 0) ;
	signal addr_write_s		: unsigned(16 downto 0);
	signal flag_s			: std_logic := '0';

begin

	P_ctrl: process(clk)
	begin
		if rising_edge(clk) then
			case state is
			
				when init => 
					state <= init_addr;
					--------
					-- HERE : this is very dangerous, as it limit the minimum 
					-- payload. The whole thing could be replaced by a dsp !
					pre_addr_s <= block_size_s(16 downto 4) * store_index_s; 
					
				when init_addr =>
					state <= run;
					--------
					addr_read_s <= (others => '0'); 
					addr_write_s <= pre_addr_s(12 downto 0) & "0000";  
					flag_s <= '1';

				when run =>
					if addr_read_s = block_size_s then  
						 state <= idle;
					else
						 state <= run;
					end if ;
					--------
					addr_read_s <= addr_read_s + 1;
					addr_write_s <= addr_write_s + 1;
					
				when idle =>
					if ( start_i = '1' and start_s = '0' ) then
						 state <= init;
					else
						 state <= idle;
					end if ;
					--------
					flag_s <= '0';
					
			end case;

		end if;
	end process;

	P_out: process(clk)
	begin
		if rising_edge(clk) then

			if (flag_s = '1') then
				en_store_o <= '1';
				addr_read_o <= std_logic_vector(addr_read_s); 
				addr_write_o <= std_logic_vector(addr_write_s - delay);
			else
				en_store_o <= '0';
				addr_read_o <= (others => '0');
				addr_write_o <= (others => '0');
			end if;
			
		end if;
	end process;
	
	P_reg: process(clk)
	begin
		if rising_edge(clk) then

			start_s <= start_i;
			block_size_s <= unsigned(block_size_i);
			store_index_s <= unsigned(store_index_i);

		end if;
	end process;

end Behavioral;

