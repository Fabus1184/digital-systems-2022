
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FourBitAdder is
	port(
		A, B	    	: in std_logic_vector(3 downto 0);
		OutputA		: out std_logic_vector(6 downto 0);
		OutputB		: out std_logic_vector(6 downto 0)
	);
end FourBitAdder;

architecture FourBitAddA of FourBitAdder is

signal I1, I2, I3 : std_logic;

signal Sum			: std_logic_vector(3 downto 0);

signal Carry      : std_logic;

component HalfAdd is
	port(
		A, B			: in std_logic;
		Sum, Cout 	: out std_logic
	);
end component HalfAdd;

component FullAdd is
	port(
		A, B, Cin 	: in std_logic;
		Sum, Cout 	: out std_logic
	);
end component FullAdd;

component BinaryTo7Segment is
	port(
		Input 				: in std_logic_vector(7 downto 0);
		OutputA				: out std_logic_vector(6 downto 0);
		OutputB				: out std_logic_vector(6 downto 0)
	);
end component BinaryTo7Segment;

begin

	F1: FullAdd port map (A(3), B(3), I3, Sum(3), Carry);
	F2: FullAdd port map (A(2), B(2), I2, Sum(2), I3);
	F3: FullAdd port map (A(1), B(1), I1, Sum(1), I2);
	H1: HalfAdd port map (A(0), B(0), Sum(0), I1);
	
	Seg: BinaryTo7Segment port map (b"11111111" xor (b"000" & Carry & Sum), OutputA, OutputB);

end FourBitAddA;