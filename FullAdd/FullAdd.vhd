
library ieee;
use ieee.std_logic_1164.all;

entity FullAdd is
	port(
		A, B, Cin	: in std_logic;
		Sum, Cout 	: out std_logic
	);
end FullAdd;

architecture FullAddA of FullAdd is

signal I1, I2, I3 : std_logic;

component HalfAdd is
	port(
		A, B 			: in std_logic;
		Sum, Cout 	: out std_logic
	);
end component HalfAdd;

begin

	U1: HalfAdd port map (A, B, I1, I2);
	U2: HalfAdd port map (I1, Cin, Sum, I3);
	Cout <= I2 or I3;

end FullAddA;