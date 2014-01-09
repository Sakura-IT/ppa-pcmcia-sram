LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY cis IS
	PORT ( d : OUT  STD_LOGIC_VECTOR (7 downto 0);
           a : IN  STD_LOGIC_VECTOR (4 downto 0);
           oe : IN  STD_LOGIC;
           cs : IN  STD_LOGIC;
           mode : IN  STD_LOGIC); -- 1 means disk
END cis;

ARCHITECTURE behavioral OF cis IS
	TYPE mem IS ARRAY (0 to 2**4) OF STD_LOGIC_VECTOR(7 downto 0);
	CONSTANT cis_rom_ram : mem := (
		0 => "00000001",
		1 => "00000011",
		2 => "00000010",
		3 => "00000101",
		4 => "00000110",
		5 => "00000111",
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
		16 => "00000000");
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
		16 => "00000000");
BEGIN

	d <= cis_rom_ram(0) WHEN a="00000" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(1) WHEN a="00001" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(2) WHEN a="00010" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(3) WHEN a="00011" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(4) WHEN a="00100" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(5) WHEN a="00101" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(6) WHEN a="00110" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(7) WHEN a="00111" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(8) WHEN a="01000" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(9) WHEN a="01001" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(10) WHEN a="01010" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(11) WHEN a="01011" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(12) WHEN a="01100" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(13) WHEN a="01101" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(14) WHEN a="01110" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_ram(15) WHEN a="01111" AND oe='0' AND cs='0' AND mode='0' ELSE
		 cis_rom_disk(0) WHEN a="00000" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(1) WHEN a="00001" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(2) WHEN a="00010" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(3) WHEN a="00011" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(4) WHEN a="00100" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(5) WHEN a="00101" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(6) WHEN a="00110" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(7) WHEN a="00111" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(8) WHEN a="01000" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(9) WHEN a="01001" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(10) WHEN a="01010" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(11) WHEN a="01011" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(12) WHEN a="01100" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(13) WHEN a="01101" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(14) WHEN a="01110" AND oe='0' AND cs='0' AND mode='1' ELSE
		 cis_rom_disk(15) WHEN a="01111" AND oe='0' AND cs='0' AND mode='1' ELSE
		"ZZZZZZZZ";

END behavioral;

