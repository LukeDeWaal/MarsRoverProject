library IEEE;
-- Here you can specify the libraries you want to use:



entity counter is
	port (	clk		: in	std_logic;
		reset		: in	std_logic;

		count_out	: out	std_logic_vector (?? downto 0)
	);
end entity counter;
