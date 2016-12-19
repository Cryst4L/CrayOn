----------------------------------------------------------------------------------
-- Engineer: B. Halimi
-- Description: Micro-program memory with some loading logic
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PRAM is
	Port ( 
		clk					: in std_logic;
		-- read an instruction
		stack_pointer_i		: in std_logic_vector(11 downto 0);
		instruction_o		: out std_logic_vector(15 downto 0);
		-- load the program from the input buffer 
		load_program_i		: in std_logic;
		load_data_read_i	: in std_logic_vector(7 downto 0);
		load_addr_read_o	: out std_logic_vector(16 downto 0)
	);			  
end PRAM;

architecture behavioral of PRAM is

	constant DELAY				: natural := 4;
	constant PAYLOAD			: natural := 4096;
	
	signal load_buffer_s		: std_logic := '0';
	signal load_toggle_s		: std_logic := '0';
	
	signal load_flag_read_s		: std_logic := '0';
	signal load_flag_write_s	: std_logic := '0';
	signal load_flag_write_b_s	: std_logic := '0';
	signal load_flag_line_s		: std_logic_vector(0 to DELAY-1);
	
	signal load_addr_read_s		: unsigned(13 downto 0);
	signal load_addr_write_s	: unsigned(13 downto 0);
	signal load_addr_write_b_s	: unsigned(13 downto 0);
	
	signal load_data_msb_s		: std_logic_vector(7 downto 0);
	signal load_data_write_s	: std_logic_vector(15 downto 0);

begin

    -- µ-Program Memory 
    I_program_memory : entity work.program_memory
	port map(
		clka	=> clk, 
		wea		=> (others => load_flag_write_b_s),
		addra	=> std_logic_vector(load_addr_write_b_s(11 downto 0)),
		dina	=> std_logic_vector(load_data_write_s),
		clkb	=> clk, 
		addrb	=> stack_pointer_i,
		doutb	=> instruction_o
	);

	P_load: process(clk)
	begin
		if rising_edge(clk) then
			-- trigger	
			if load_program_i = '1' and load_buffer_s = '0' then
				load_flag_read_s <= '1';
				load_addr_read_s <= (others => '0');
			-- load (read)
			elsif load_flag_read_s = '1' then
				if load_addr_read_s = (2*PAYLOAD-1) then
					load_flag_read_s <= '0';
				else
					load_addr_read_s <= load_addr_read_s + 1;				
				end if;
			-- idle
			else
				load_flag_read_s <= '0';
			end if;
			
			-- load (write)
			if load_flag_write_s = '1' then	
				load_toggle_s <= not(load_toggle_s);
				if (load_toggle_s = '0') then
					load_data_msb_s <= load_data_read_i;
				else
					load_data_write_s <= load_data_msb_s & load_data_read_i;
					load_addr_write_s <= load_addr_write_s + 1; 
				end if;
			else
				load_addr_write_s <= (others => '0');
				load_toggle_s <= '0';
			end if;
					
			-- enable delay line
			load_flag_line_s(0 to DELAY-2) <= load_flag_line_s(1 to DELAY-1);
			load_flag_line_s(DELAY-1) <= load_flag_read_s;
			
			-- buffering
			load_buffer_s <= load_program_i;
			load_addr_write_b_s <= load_addr_write_s;
			load_flag_write_b_s <= load_flag_write_s;
			
		end if;
	end process;
	
	load_flag_write_s <= load_flag_line_s(0);
	load_addr_read_o <= "000" & std_logic_vector(load_addr_read_s);

end behavioral;