library ieee;
use ieee.std_logic_1164.all;

entity VGA is
	port(
		VGA_R : out std_logic_vector(7 downto 0);
		VGA_G : out std_logic_vector(7 downto 0);
		VGA_B : out std_logic_vector(7 downto 0);
		VGA_CLK : out std_logic;
		VGA_HSYNC : out std_logic;
		VGA_VSYNC : out std_logic;
		VGA_BLANK : out std_logic;
		VGA_SYNC : out std_logic;
		CLK : in std_logic
		);
end VGA;

architecture Behaviour of VGA is

	signal X : natural range 0 to 1064 := 1064;
	signal Y : natural range 0 to 624 := 624;
	constant ONN : std_logic_vector (7 downto 0) := "11111111";
	constant OFF : std_logic_vector (7 downto 0) := "00000000";

begin

	VGA_CLK <= CLK;
	VGA_SYNC <= '0';
	
	COUNTER_X : process (CLK) begin
		if (rising_edge(CLK)) then
			if (X = 1064) then 
				X <= 0;
			else
				X <= X + 1;
			end if;
		end if;
	end process;
	
	COUNTER_Y : process (CLK) begin
		if (rising_edge(CLK)) then
			if (Y = 624) then
				Y <= 0;
			elsif (X = 1064) then
				Y <= Y + 1;
			end if;
		end if;
	end process;
	
	P : process (CLK) begin
		if (rising_edge(CLK)) then
			if (X < 80) then
				VGA_HSYNC <= '0';
			else
				VGA_HSYNC <= '1';
			end if;
			
			if (Y < 3) then
				VGA_VSYNC <= '0';
			else
				VGA_VSYNC <= '1';
			end if;
			
			if (X < 250 or X > 1049 or Y < 24) then
				VGA_BLANK <= '0';
			else
				VGA_BLANK <= '1';
			end if;
			
			if (X > 249 and X <= 349 and Y > 23) then
				VGA_R <= ONN;
				VGA_G <= ONN;
				VGA_B <= ONN;
			elsif (X > 349 and X <= 449 and Y > 23) then
				VGA_R <= ONN;
				VGA_G <= ONN;
				VGA_B <= OFF;			
			elsif (X > 449 and X <= 549 and Y > 23) then
				VGA_R <= OFF;
				VGA_G <= ONN;
				VGA_B <= ONN;
			elsif (X > 549 and X <= 649 and Y > 23) then
				VGA_R <= OFF;
				VGA_G <= ONN;
				VGA_B <= OFF;
			elsif (X > 649 and X <= 749 and Y > 23) then
				VGA_R <= ONN;
				VGA_G <= OFF;
				VGA_B <= ONN;
			elsif (X > 749 and X <= 849 and Y > 23) then
				VGA_R <= ONN;
				VGA_G <= OFF;
				VGA_B <= OFF;
			elsif (X > 849 and X <= 949 and Y > 23) then
				VGA_R <= OFF;
				VGA_G <= OFF;
				VGA_B <= ONN;
			elsif (X > 949 and X <= 1049 and Y > 23) then
				VGA_R <= OFF;
				VGA_G <= OFF;
				VGA_B <= OFF;
			else
				VGA_R <= OFF;
				VGA_G <= OFF;
				VGA_B <= OFF;
			end if;
		end if;
	end process;
	
end Behaviour;
		
		