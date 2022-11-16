library ieee;
use ieee.std_logic_1164.all;

entity BinaryTo7Segment is
	port(
		Input 				: in std_logic_vector(7 downto 0);
		OutputA				: out std_logic_vector(6 downto 0);
		OutputB				: out std_logic_vector(6 downto 0)
);
end BinaryTo7Segment;

architecture BinaryTo7SegmentA of BinaryTo7Segment is
signal LowBits:	std_logic_vector(3 downto 0);
signal HighBits:	std_logic_vector(3 downto 0);
begin

	LowBits <= Input(3 downto 0);
	HighBits <= Input(7 downto 4);

	with LowBits select 
		OutputB <= "1000000" when "1111", -- 0
					  "1111001" when "1110", -- 1
					  "0100100" when "1101", -- 2
					  "0110000" when "1100", -- 3
					  "0011001" when "1011", -- 4
					  "0010010" when "1010", -- 5
					  "0000010" when "1001", -- 6
					  "1111000" when "1000", -- 7
					  "0000000" when "0111", -- 8
					  "0011000" when "0110", -- 9
					  "0001000" when "0101", -- A
					  "0000011" when "0100", -- b
					  "1000110" when "0011", -- C
					  "0100001" when "0010", -- d
					  "0000110" when "0001", -- E
					  "0001110" when "0000", -- F
					  "1001001" when others;
					  
		with HighBits select 
		OutputA <= "1000000" when "1111", -- 0
					  "1111001" when "1110", -- 1
					  "0100100" when "1101", -- 2
					  "0110000" when "1100", -- 3
					  "0011001" when "1011", -- 4
					  "0010010" when "1010", -- 5
					  "0000010" when "1001", -- 6
					  "1111000" when "1000", -- 7
					  "0000000" when "0111", -- 8
					  "0011000" when "0110", -- 9
					  "0001000" when "0101", -- A
					  "0000011" when "0100", -- b
					  "1000110" when "0011", -- C
					  "0100001" when "0010", -- d
					  "0000110" when "0001", -- E
					  "0001110" when "0000", -- F
					  "1001001" when others;
end BinaryTo7SegmentA;