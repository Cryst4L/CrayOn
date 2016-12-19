----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Additional Comments: 
-- Controller of the Activation and Pooling instructions
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ActivControl is
	Port ( 
		clk				: in std_logic;
		start_i			: in std_logic;
		pool_mode_i		: in std_logic;
		block_size_i	: in std_logic_vector (16 downto 0);
		block_width_i	: in std_logic_vector (8 downto 0);
		actv_index_i	: in std_logic_vector (3 downto 0);
		en_fire_o		: out std_logic;
		----------------------------------------------------
		addr_write_o	: out std_logic_vector (16 downto 0);
		addr_read_o		: out std_logic_vector (16	downto 0)
	);
end ActivControl;

architecture Behavioral of ActivControl is

	-- r/w pipeline delays
	constant delay_pool		: natural := 3;
	constant delay_no_pool	: natural := 9;

	type enum is (init, solve, pool_a, pool_b, pool_c, pool_d, no_pool, idle);
	signal state			: enum := idle;
	
	signal block_width_s	: unsigned(8 downto 0);
	signal block_size_s		: unsigned(16 downto 0);

	-- fsm signals
	signal start_s			: std_logic := '0';
	signal actv_index_s		: unsigned(3 downto 0);
	
	signal addr_read_s		: unsigned(16 downto 0);
	signal addr_write_s		: unsigned(16 downto 0);
	
	signal input_offset_s	: unsigned(20 downto 0);
	signal output_offset_s	: unsigned(18 downto 0);
	
	signal col_cnt_s		: unsigned(7 downto 0);
	signal flag_s			: std_logic := '0';

begin

	P_ctrl: process(clk)
	begin
		if rising_edge(clk) then
			case state is		
				
				when init => 
					state <= solve;
					--------
					input_offset_s <= actv_index_s * block_size_s;
					output_offset_s <= actv_index_s * block_size_s(16 downto 2);

				when solve => 
					if (pool_mode_i = '1') then
						state <= pool_a;
					else
						state <= no_pool;	
					end if;
					--------
					addr_read_s <= input_offset_s(16 downto 0);
					addr_write_s <= output_offset_s(16 downto 0);
					col_cnt_s <= (others => '0');
					flag_s <= '1';
		
				when pool_a =>
					state <= pool_b;
					--------
					addr_read_s <= addr_read_s + block_width_s;					--width 
			
				when pool_b =>
					state <= pool_c;
					--------
					addr_read_s <= unsigned(addr_read_s) + 1;
					
				when pool_c =>
					state <= pool_d;
					--------
					addr_read_s <= addr_read_s - block_width_s;					-- width 
					
				when pool_d =>
					if addr_read_s > (input_offset_s + block_size_s - 1) then	--0.25 * width * height 
						state <= idle;
					else
						state <= pool_a;
					end if ;
					--------
					if col_cnt_s = block_width_s(8 downto 1) - 1 then			-- 0.5 * width - 1	
						addr_read_s <= addr_read_s + block_width_s + 1;			-- width + 1
						col_cnt_s <= (others => '0');
					else
						addr_read_s <= addr_read_s + 1;
						col_cnt_s <= col_cnt_s + 1;
					end if;
					addr_write_s <= addr_write_s + 1;

				when no_pool =>
					if addr_read_s > (input_offset_s + block_size_s - 1) then	
						state <= idle;
					else
						state <= no_pool;
					end if ;
					--------
					addr_read_s <= addr_read_s + 1;
					addr_write_s <= addr_write_s + 1;

				when idle =>
					if ( start_i = '1' and start_s = '0') then
						 state <= init;
					else
						 state <= idle;
					end if;
					--------
					flag_s <= '0';

			end case;
			
		end if;
	end process;
	
	P_reg: process(clk)
	begin
		if rising_edge(clk) then
		
			start_s <= start_i;
			block_width_s <= unsigned(block_width_i);
			block_size_s <= unsigned(block_size_i);
			actv_index_s <= unsigned(actv_index_i);
			en_fire_o <= flag_s;	
				
		end if;
	end process;

	P_out: process(clk)
	begin
		if rising_edge(clk) then
		
			if (flag_s = '1') then
				if (pool_mode_i = '1') then
					addr_write_o <= std_logic_vector(addr_write_s - delay_pool); 
				else
					addr_write_o <= std_logic_vector(addr_write_s - delay_no_pool); 
				end if;
				addr_read_o <= std_logic_vector(addr_read_s); 
			else
				addr_read_o <= (others => '0');
				addr_write_o <= (others => '0');
			end if;
			
		end if;
	end process;
	
end Behavioral;

