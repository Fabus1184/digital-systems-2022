library ieee;
use ieee.std_logic_1164.all;

entity JK_FlipFlop is
	port(
		ENABLE	: in std_logic;
		J	    : in std_logic;
		K	    : in std_logic;
		CLK     : in std_logic;
		Q	    : out std_logic;
		NQ      : out std_logic
		);
end JK_FlipFlop;

architecture Behaviour of JK_FlipFlop is
	signal STATE: std_logic := '0';
begin
	A: process begin
		wait until CLK = '1';
		if (ENABLE = '1') then
			if (J = '0' and K = '1') then
				STATE <= '0';
			elsif (J = '1' and K = '0') then
				STATE <= '1';
			elsif (J = '1' and K = '1') then
				STATE <= NOT(STATE);
			end if;
		end if;
	end process;
	Q <= STATE;
	NQ <= NOT(STATE);
end Behaviour;
