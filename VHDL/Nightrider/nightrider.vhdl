library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nightrider is
	port (	clk	: in	std_logic;
		reset	: in	std_logic;
		leds	: out	std_logic_vector (15 downto 0)
	);
end entity nightrider;

architecture behavioural of nightrider is

	-- count and new_count are 25-bit numbers
	signal count, new_count		: unsigned (24 downto 0);

	-- leds_out and new_leds_out are std-logic vectors (a collection of bits)
	signal leds_out, new_leds_out	: std_logic_vector (29 downto 0);

	-- compare is used to wait for 0.1 second. The clockfrequency is 100 MHz
	-- so in order to wait for 0.1 second, compare should have the value
	-- 10000000
	constant compare		: integer := 10000000;

begin
	leds (0)	<= leds_out(0);
	leds (1)	<= leds_out(1) or leds_out(29);
	leds (2)	<= leds_out(2) or leds_out(28);
	leds (3)	<= leds_out(3) or leds_out(27);
	leds (4)	<= leds_out(4) or leds_out(26);
	leds (5)	<= leds_out(5) or leds_out(25);
	leds (6)	<= leds_out(6) or leds_out(24);
	leds (7)	<= leds_out(7) or leds_out(23);
	leds (8)	<= leds_out(8) or leds_out(22);
	leds (9)	<= leds_out(9) or leds_out(21);
	leds (10)	<= leds_out(10)or leds_out(20);
	leds (11)	<= leds_out(11)or leds_out(19);
	leds (12)	<= leds_out(12)or leds_out(18);
	leds (13)	<= leds_out(13)or leds_out(17);
	leds (14)	<= leds_out(14)or leds_out(16);
	leds (15)	<= leds_out(15);

	process (clk)
	begin
		if (rising_edge (clk)) then
			if (reset = '1') then
				count 		<= (others => '0');
				leds_out	<= "000000000000000000000000000001";
			else
				count 		<= new_count;
				leds_out	<= new_leds_out;
			end if;
		end if;
	end process;

	process (count, leds_out)
	begin
		if (count >= compare) then
			new_count	<= (others => '0');
			-- "rol" means rotate left.
			new_leds_out	<= std_logic_vector (unsigned (leds_out) rol 1);
		else
			new_count	<= count + 1;
			new_leds_out	<= leds_out;
		end if;
	end process;
end architecture behavioural;
