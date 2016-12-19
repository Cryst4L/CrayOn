----------------------------------------------------------------------------------
-- Engineer: B. Halimi
-- Description: Kernel Loading Unit
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity KLU is
	Generic ( 
		VL	: natural;
		W	: natural;
		D	: natural );
	Port ( 
		clk					: in std_logic;
		-- receive a push kernel order
		push_kernel_i		: in std_logic;
		kernel_index_i		: in std_logic_vector(9 downto 0);
		-- push the corresponding kernel to the ALU
		weight_value_o		: out std_logic_vector(W-1 downto 0);
		en_push_kernel_o	: out std_logic;
		-- load the kernels from the input buffer
		load_kernel_i		: in std_logic;
		load_index_i		: in std_logic_vector(1 downto 0);
		load_data_read_i	: in std_logic_vector(7 downto 0);
		load_addr_read_o	: out std_logic_vector(16 downto 0)
	);			  
end KLU;

architecture behavioral of KLU is

	-- PUSHING
	signal push_buf_s			: std_logic := '0';
	signal push_flag_s 			: std_logic := '0';
	
	signal push_counter_s		: unsigned(9 downto 0); -- WARNING: >= (D*D+1)*VL
	signal push_addr_read_s		: unsigned(17 downto 0);
	
	signal weight_value_s		: std_logic_vector(11 downto 0);
	
	-- LOADING (using 32k parameters chunks) 
	constant DELAY				: natural := 4;
	
	signal load_buffer_s		: std_logic := '0';
	signal load_toggle_s		: std_logic := '0';
	
	signal load_flag_read_s		: std_logic := '0';
	signal load_flag_write_s	: std_logic := '0';
	signal load_flag_write_b_s	: std_logic := '0';
	signal load_flag_line_s		: std_logic_vector(0 to DELAY-1);
	
	signal load_addr_read_s		: unsigned(16 downto 0);
	signal load_addr_write_s	: unsigned(16 downto 0);
	signal load_addr_write_b_s	: unsigned(16 downto 0);
	
	signal load_data_msb_s		: std_logic_vector(7 downto 0);
	signal load_data_write_s	: std_logic_vector(15 downto 0);
	
begin

    -- KERNEL RAM --
    I_kernel_memory : entity work.kernel_memory
	port map(
		clka	=> clk, 
		wea		=> (others => load_flag_write_b_s),
		addra	=> std_logic_vector(load_addr_write_b_s),
		dina	=> std_logic_vector(load_data_write_s(11 downto 0)),
		clkb	=> clk, 
		addrb	=> std_logic_vector(push_addr_read_s(16 downto 0)), 
		doutb	=> weight_value_s
	);
	
	weight_value_o <= (W-1 downto 12 => weight_value_s(11)) & weight_value_s; -- VILAIN A CHANGER

	-- PUSH KERNELS TO THE CAU --	
	P_push: process(clk)
	begin
		if rising_edge(clk) then	
			-- trigger	
			if push_kernel_i = '1' and push_buf_s = '0' then
				push_flag_s <= '1';
				push_addr_read_s <= unsigned(kernel_index_i) * to_unsigned(D*D+1,8);
				push_counter_s <= (others => '0');
			-- push	
			elsif push_flag_s = '1' then
				if push_counter_s = (D*D+1)*VL+1 then --HERE : -1
					push_flag_s <= '0';
				else
					push_addr_read_s <= push_addr_read_s + 1;
					push_counter_s <= push_counter_s +1;
				end if;
			-- idle
			else
				push_flag_s <= '0';
			end if;		
		end if;
	end process;
	
	en_push_kernel_o <= push_flag_s;
	push_buf_s <= push_kernel_i when rising_edge(clk);
	
	-- LOAD KERNELS FROM THE INPUT BUFFER --
	P_load: process(clk)
	begin
		if rising_edge(clk) then
			-- trigger	
			if load_kernel_i = '1' and load_buffer_s = '0' then
				load_flag_read_s <= '1';
				load_addr_read_s <= (others => '0');
			-- load (read)
			elsif load_flag_read_s = '1' then
				if load_addr_read_s = 65535 then
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
				load_addr_write_s <= unsigned(load_index_i) & (14 downto 0 => '0'); --(others => '0');
				load_toggle_s <= '0';
			end if;
					
			-- enable delay line
			load_flag_line_s(0 to DELAY-2) <= load_flag_line_s(1 to DELAY-1);
			load_flag_line_s(DELAY-1) <= load_flag_read_s;
			
			-- buffering
			load_buffer_s <= load_kernel_i;
			load_addr_write_b_s <= load_addr_write_s;
			load_flag_write_b_s <= load_flag_write_s;
			
		end if;
	end process;
	
	load_flag_write_s <= load_flag_line_s(0);
	load_addr_read_o <= std_logic_vector(load_addr_read_s);
	
end behavioral;


