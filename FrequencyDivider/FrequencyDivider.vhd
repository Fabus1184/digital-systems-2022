library ieee;
use ieee.std_logic_1164.all;

entity FrequencyDivider is
	generic(DIV : natural := 10);
	port(
		CLK		: in std_logic;
		SUB_CLK	: out std_logic
		);
end FrequencyDivider;

architecture Behaviour of FrequencyDivider is
	signal TEMP	: std_logic;
	signal COUNTER : natural := 0;
begin
	FrequencyDivider: process(CLK) begin
		if (COUNTER = DIV) then
			TEMP <= '1';
			COUNTER <= 0;
		elsif rising_edge(CLK) then
			TEMP <= '0';
			COUNTER <= COUNTER + 1;
		end if;
	end process;
	SUB_CLK <= TEMP;
end Behaviour;
		
		
