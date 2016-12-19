----------------------------------------------------------------------------------
-- Engineer: B. Halimi
-- Description: 
-- Scrappy and over-simplified version of the Connexion Router. Must be changed. 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity Router is
	Generic( 
		VL	: natural;
		W	: natural);
	Port (
		clk					: in  std_logic;
		-- Neural Units interconnexion
		fill_mode_i			: in std_logic;
		input_data_i		: in std_logic_vector(W-1 downto 0);
		activ_ribbon_i		: in  std_logic_vector(VL*W-1 downto 0);
		activ_select_i		: in  std_logic_vector(3 downto 0);
		activ_ribbon_o 		: out std_logic_vector(VL*W-1 downto 0);
		-- Store the feature maps
		map_select_i		: in  std_logic_vector(3 downto 0);
		map_ribbon_i		: in  std_logic_vector(VL*W-1 downto 0);
		store_data_o		: out  std_logic_vector(W-1 downto 0)
	);
end Router;

architecture behavioral of Router is

	-- Routing Signals
	signal input_data_s			: std_logic_vector(W-1 downto 0);
	signal activ_ribbon_s		: std_logic_vector(VL*W-1 downto 0);

	signal inter_source_s		: std_logic_vector(W-1 downto 0);
	signal ribbon_routed_s		: std_logic_vector(VL*W-1 downto 0);

	signal route_select_s		: integer;
	signal route_slice_msb_s	: integer;
	signal route_slice_lsb_s	: integer;

	-- Store Signals
	signal store_source_s		: std_logic_vector(W-1 downto 0);
	signal data_store_s			: std_logic_vector(W-1 downto 0); 

	signal store_select_s		: integer;
	signal store_slice_msb_s	: integer;
	signal store_slice_lsb_s	: integer;

begin 

 	-- Select the source
	P_inter: process(clk)
	begin 
		if rising_edge(clk) then

			route_select_s <= VL - to_integer(unsigned(activ_select_i));
		
			route_slice_msb_s <= W * (route_select_s) - 1;
			route_slice_lsb_s <= W * (route_select_s - 1);
		
			if(fill_mode_i = '1') then
				inter_source_s <= input_data_s;
			else	
				inter_source_s <= activ_ribbon_s(route_slice_msb_s downto route_slice_lsb_s);
			end if;
			
			activ_ribbon_s <= activ_ribbon_i;
			activ_ribbon_o <= ribbon_routed_s;
			input_data_s <= input_data_i;

		end if;
	end process;

	-- Duplicate the source
	G_inter: for k in 0 to VL-1 generate 
		ribbon_routed_s((k+1)*W-1 downto k*W) <= inter_source_s when rising_edge(clk);
	end generate G_inter;
				 
	-- Store Selection			 
	P_store: process(clk) -- 0 -> ribbon's MSB; max -> ribbon's LSB;			
	begin
		if rising_edge(clk) then
		
			store_select_s <= VL - to_integer(unsigned(map_select_i));
		
			store_slice_msb_s <= W * (store_select_s) - 1;
			store_slice_lsb_s <= W * (store_select_s - 1);
			
			store_source_s <= map_ribbon_i(store_slice_msb_s downto store_slice_lsb_s);
			store_data_o <= store_source_s;
			
		end if;	
	end process;	

end behavioral;