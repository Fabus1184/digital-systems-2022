
library ieee;
use ieee.std_logic_1164.all;

entity HalfAdd is
	port(
		A, B 			: in std_logic;
		Sum, Cout 	: out std_logic
	);
end HalfAdd;

architecture HalfAddA of HalfAdd is begin

	Sum	<=		A xor B;
	Cout  <=		a and B;

end HalfAddA;