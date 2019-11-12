library IEEE;
-- Here you can specify the libraries you want to use:



entity pwm_generator is
	port (	clk		: in	std_logic;
		reset		: in	std_logic;
		direction	: in	std_logic;
		count_in	: in	std_logic_vector (?? downto 0);

		pwm		: out	std_logic
	);
end entity pwm_generator;
