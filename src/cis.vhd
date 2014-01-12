LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY cis IS
	PORT ( d : OUT  STD_LOGIC_VECTOR (7 downto 0);
           a : IN  STD_LOGIC_VECTOR (4 downto 0);
           oe : IN  STD_LOGIC;
           cs : IN  STD_LOGIC;
           mode : IN  STD_LOGIC); -- 1 means disk
END cis;

ARCHITECTURE behavioral OF cis IS
	TYPE mem IS ARRAY (0 to 31) OF STD_LOGIC_VECTOR(7 downto 0);
	CONSTANT cis_rom_ram : mem := (
		0 => "00000001",	-- tuple: CIS device
		1 => "00000011",	-- tuple: link to next
		2 => "01100000",	-- SRAM 100 ns
		3 => "00001110",	-- 4MB
		4 => "11111111",	-- tuple: end
		5 => "00010101",	-- tuple: version 1
		6 => "00001101",	-- tuple: link to next
		7 => "00000100",	-- PCMCIA 1.x
		8 => "00000001",	-- PCMCIA 1.1
		9 => "01010000",	-- P
		10 => "01010000",	-- P
		11 => "01000001",	-- A
		12 => "00000000",	-- NULL delimeter
		13 => "01010011",	-- S
		14 => "00000000",	-- R
		15 => "01010010",	-- A
		16 => "01000001",	-- M
		17 => "00000000",	-- NULL delimeter
		18 => "00000000",	-- NULL delimeter
		19 => "11111111",	-- tuple: end
		20 => "11111111",	-- tuple: end of chain
		21 => "11111111",
		22 => "11111111",
		23 => "11111111",
		24 => "11111111",
		25 => "11111111",
		26 => "11111111",
		27 => "11111111",
		28 => "11111111",
		29 => "11111111",
		30 => "11111111",
		31 => "11111111");
	CONSTANT cis_rom_disk : mem := (
		0 => "00000000",
		1 => "00000001",
		2 => "00000000",
		3 => "00000001",
		4 => "00000000",
		5 => "00000001",
		6 => "00000000",
		7 => "00000001",
		8 => "00000000",
		9 => "00000001",
		10 => "00000000",
		11 => "00000001",
		12 => "00000000",
		13 => "00000001",
		14 => "00000000",
		15 => "00000001",
		16 => "00000000",
		17 => "00000000",
		18 => "00000000",
		19 => "00000000",
		20 => "00000000",
		21 => "11111111",
		22 => "11111111",
		23 => "11111111",
		24 => "11111111",
		25 => "11111111",
		26 => "11111111",
		27 => "11111111",
		28 => "11111111",
		29 => "11111111",
		30 => "11111111",
		31 => "11111111");
BEGIN

	d <= cis_rom_ram(TO_INTEGER(UNSIGNED(a))) WHEN oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_disk(TO_INTEGER(UNSIGNED(a))) WHEN oe='0' AND cs='0' AND mode='1' ELSE
		"ZZZZZZZZ";

END behavioral;

