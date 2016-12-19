----------------------------------------------------------------------------------
-- Engineer: B Halimi
-- Description: Master 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Master is
	Generic ( 
		VL	: natural;
		D	: natural);
    Port (
		clk        		: in std_logic;
		-- Synchronize
		sync_i			: in std_logic;
		-- µProgram Memory read
		instruction_i	: in std_logic_vector(15 downto 0);
		stack_pointer_o	: out std_logic_vector(11 downto 0);
		-- Kernel Memory
		push_kernel_o	: out std_logic;
		kernel_index_o	: out std_logic_vector(9 downto 0);
		-- Start Signals
		start_conv_o	: out std_logic;
		start_store_o	: out std_logic;
		start_fire_o	: out std_logic;
		-- Config bus
		fill_mode_o		: out std_logic;
		acc_mode_o		: out std_logic;
		pool_mode_o		: out std_logic;
		rect_mode_o		: out std_logic_vector(2 downto 0);
		cyclic_order_o	: out std_logic_vector(3 downto 0);
		block_width_o	: out std_logic_vector(8 downto 0);
		block_size_o	: out std_logic_vector(16 downto 0);
		store_index_o	: out std_logic_vector(7 downto 0);
		store_select_o	: out std_logic_vector(3 downto 0);
		input_index_o	: out std_logic_vector(3 downto 0);
		output_index_o	: out std_logic_vector(3 downto 0)
		--debug_o : out std_logic
    );
end Master;

architecture behavioral of Master is

    --déclaration des états
    type enum is (fetch, decode, call, hold);
    signal state 			: enum := hold;

    --signaux internes évenementiels
    signal release_s 		: std_logic;
    signal hold_counter_s 	: unsigned(16 downto 0);
    signal width_shift 		: integer;
    signal size_shift 		: integer;

    -- signaux de controle du master
    signal push_kernel_s 	: std_logic := '0';
    signal start_conv_s 	: std_logic := '0';
    signal start_store_s 	: std_logic := '0';
    signal start_fire_s 	: std_logic := '0';
    signal restart_s 		: std_logic := '0';

    -- P-bus
    signal store_index_s	: std_logic_vector(7 downto 0);
    signal kernel_index_s	: std_logic_vector(9 downto 0);
    signal fill_mode_s		: std_logic := '0';
    signal acc_mode_s 		: std_logic := '0';
    signal pool_mode_s 		: std_logic := '0';
    signal rect_mode_s 		: std_logic_vector(2 downto 0);
    signal block_width_s	: std_logic_vector(8 downto 0);
    signal block_size_s		: std_logic_vector(16 downto 0);
    signal store_select_s	: std_logic_vector(3 downto 0);
    signal cyclic_order_s	: std_logic_vector(3 downto 0);
	signal input_index_s	: std_logic_vector(3 downto 0);
	signal output_index_s	: std_logic_vector(3 downto 0);
	
	-- signaux de synchronisation
    signal sync_buff_s		: std_logic := '0';
    signal sync_flag_s		: std_logic := '0';

    -- signaux d'accès la mémoire programme
    signal stack_pointer_s	: std_logic_vector(11 downto 0);
    signal opcode_s			: std_logic_vector(3 downto 0);
    signal operande_s		: std_logic_vector(11 downto 0);
    
    -- temps de hold minimum
    constant TAU : integer := 5; 

begin
P_state_machine : process (clk)

begin
	if rising_edge(clk) then

		---------------- Machine d'Etat de Controle (Moore) ----------------

		case state is
			when fetch => 
				state <= decode;
			when decode => 
				state <= call;
			when call => 
				state <= hold;
			when hold => 
				if (release_s = '1') then
					state <= fetch;
				else
					state <= hold;
				end if;
			when others => 
				state <= fetch;
		end case;

		----------- Combinatoire des signaux de la Machine d'Etat -----------

		case state is

			-- FETCH:
			when fetch => 
			
				-- re-init de tout les signaux de start
				push_kernel_s <= '0';
				start_conv_s <= '0';
				start_store_s <= '0';
				start_fire_s <= '0';
				
				-- re-init du compteur de wait
				release_s <= '0';
				hold_counter_s <= (others => '0');
				
				-- fetch de l'opcode et des opérandes
				opcode_s <= instruction_i(15 downto 12);
				operande_s <= instruction_i(11 downto 0);
				
				-- incrémentation du pointeur de pile
				stack_pointer_s <= std_logic_vector(unsigned(stack_pointer_s) + 1);

			-- DECODE:
			when decode => 
			
					-- Jump = 0
				if opcode_s = "0000" then
					stack_pointer_s <= operande_s;
					
					-- Config = 1 
				elsif opcode_s = "0001" then
					fill_mode_s <= operande_s(8);
					cyclic_order_s <= operande_s(3 downto 0);
					width_shift <= to_integer(unsigned(operande_s(7 downto 4))) - 3; 
					size_shift  <= to_integer(unsigned(operande_s(7 downto 4))) * 2 - 6;

					-- Push Kernel = 2
				elsif opcode_s = "0010" then
					kernel_index_s <= operande_s(9 downto 0);
					
					-- Convolve = 3
				elsif opcode_s = "0011" then 
					acc_mode_s <= operande_s(8);
					input_index_s  <= operande_s(7 downto 4);
					output_index_s <= operande_s(3 downto 0);

					-- Fire = 4 
				elsif opcode_s = "0100" then
					pool_mode_s <= operande_s(11);
					rect_mode_s <= operande_s(10 downto 8);
					input_index_s  <= operande_s(7 downto 4);
					
					-- Store = 5 
				elsif opcode_s = "0101" then
					store_index_s <= operande_s(7 downto 0);
					store_select_s <= operande_s(11 downto 8);
					
				end if;

			-- CALL:
			when call => 
			
				if opcode_s = "0010" then	 -- Push Kernel = 2
					push_kernel_s <= '1';
				elsif opcode_s = "0011" then -- Convolve = 3 
					start_conv_s <= '1';
				elsif opcode_s = "0100" then -- Fire = 4 
					start_fire_s <= '1';	
				elsif opcode_s = "0101" then -- Store = 5 
					start_store_s <= '1';
				end if;

			-- HOLD:
			when hold => 
			
					-- Jump = 0
				if opcode_s = "0000" then
					release_s <= '1';
					-- Jump or Config 
				elsif (opcode_s = "0001" and hold_counter_s = TAU) then
					release_s <= '1';
					-- Push Kernel = 2
				elsif (opcode_s = "0010" and hold_counter_s = VL*(D+1)*D) then -- PUT VL*(D*D+1)+TAU HERE!
					release_s <= '1';
					-- Convolve, Pool, Store, and Sync
				elsif hold_counter_s = (unsigned(block_size_s) + TAU) then 
					release_s <= '1'; 
				end if;
				
				-- incrémentation du timer de maintien
				hold_counter_s <= hold_counter_s + 1;
		
			when others => 

		end case;

		----------- Calcul Synchrone de block_size -----------

		block_width_s <= std_logic_vector(shift_left(to_unsigned(20, 9), width_shift)); -- 20 * 16 = 320
		block_size_s <= std_logic_vector(shift_left(to_unsigned(300, 17), size_shift)); -- 300 * 256 = 76800
		
		------ Gestion du Mechanisme de Synchronisation ------
		
		sync_buff_s <= sync_i;
		if (sync_i = '1' and sync_buff_s = '0') then
			sync_flag_s <= '1';
		elsif (state = call) and (sync_flag_s = '1') then
			-- on force un jump en position 0
			stack_pointer_s <= (others => '0');
			sync_flag_s <= '0';
		end if;
		
	end if;

end process; 

	----------- Drive Asynchrone des Sorties -----------

	-- start signals
	push_kernel_o <= push_kernel_s;
	start_conv_o <= start_conv_s;
	start_fire_o <= start_fire_s;
	start_store_o <= start_store_s;

	-- config signals
	stack_pointer_o <= stack_pointer_s;
	kernel_index_o <= kernel_index_s;
	
	block_width_o <= block_width_s;
	block_size_o <= block_size_s;

	fill_mode_o <= fill_mode_s;
	cyclic_order_o <= cyclic_order_s;
	
	input_index_o <= input_index_s;
	output_index_o <= output_index_s;

	acc_mode_o <= acc_mode_s;
	pool_mode_o <= pool_mode_s;
	rect_mode_o <= rect_mode_s;
	
	store_select_o <= store_select_s;
	store_index_o <= store_index_s;

end behavioral;