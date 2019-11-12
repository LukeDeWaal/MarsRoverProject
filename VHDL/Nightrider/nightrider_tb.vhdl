library IEEE;
use IEEE.std_logic_1164.all;

entity nightrider_tb is
end entity nightrider_tb;

architecture structural of nightrider_tb is

	component nightrider
		port (	clk	: in	std_logic;
			reset	: in	std_logic;
			leds	: out	std_logic_vector (15 downto 0)
		);
	end component nightrider;

	signal	clk, reset	: std_logic;   
	signal	leds		: std_logic_vector (15 downto 0);	

begin

lbl0:	nightrider	port map (	clk 	=> clk,
					reset	=> reset,
					leds	=> leds
			);

	clk	<=	'1' after 0 ns,
			'0' after 5 ns when clk /= '0' else '1' after 5 ns;

	reset	<=	'1' after 0 ns,
			'0' after 100 ns;

end architecture structural;
