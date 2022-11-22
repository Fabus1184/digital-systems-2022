library ieee;
use ieee.std_logic_1164.all;

entity BlinkingLED is
	port(
		CLK	: in 	std_logic;
		LED	: out std_logic
		);
end BlinkingLED;

architecture Behaviour of BlinkingLED is
	signal	SUB_CLK	: std_logic;
	signal	CONST_ON	: std_logic := '1';
	
	component FrequencyDivider 
		generic (DIV : natural);
		port(CLK : in std_logic; SUB_CLK : out std_logic);
	end component;
	
	component JK_FlipFlop 
		port(
			ENABLE	: in std_logic;
			J	: in std_logic;
			K	: in std_logic;
			CLK: in std_logic;
			Q	: out std_logic;
			NQ : out std_logic
		);
	end component;
begin
	CD: FrequencyDivider generic map (DIV => 10000000) port map (CLK, SUB_CLK);
	JKFF: JK_FlipFlop port map (SUB_CLK, CONST_ON, CONST_ON, CLK, LED, open);
end Behaviour;
		
		