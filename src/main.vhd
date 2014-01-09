LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY main IS
    PORT ( ce1 : IN  STD_LOGIC;
           ce2 : IN  STD_LOGIC;
           reg : IN  STD_LOGIC;
           a0 : IN  STD_LOGIC;
           oe_even : OUT  STD_LOGIC;	-- OE for even byte
           oe_odd : OUT  STD_LOGIC;		-- OE for odd byte
           oe_oddlow : OUT  STD_LOGIC;	-- OE odd byte on d0-d7
           ce_attr_external : OUT  STD_LOGIC;-- external CE for attribute memory
           ce_upp : OUT  STD_LOGIC;		-- CE for upper SRAM
           ce_low : OUT  STD_LOGIC;		-- CE for lower SRAM

           rom_internal : IN  STD_LOGIC;-- ROM internal/external jumper 
           rom_mode : IN  STD_LOGIC;    -- internal ROM type (RAM/disk)
           -- signals for internal ROM
           oe : IN  STD_LOGIC;
           data : OUT  STD_LOGIC_VECTOR(7 downto 0);
           addr : IN  STD_LOGIC_VECTOR(4 downto 0));
		   
END main;

ARCHITECTURE behavioral OF main IS

	COMPONENT cis IS 
		PORT (  d : OUT  STD_LOGIC_VECTOR (7 downto 0);
			a : IN  STD_LOGIC_VECTOR (4 downto 0);
			oe : IN  STD_LOGIC;
			cs : IN  STD_LOGIC;
			mode : IN  STD_LOGIC);	
		END COMPONENT;

	SIGNAL s_rom_oe: STD_LOGIC;
	SIGNAL s_rom_cs: STD_LOGIC;
	SIGNAL s_rom_data: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL s_rom_addr: STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL s_rom_mode: STD_LOGIC;
	SIGNAL s_ce_attr: STD_LOGIC;
BEGIN

	cis_rom: COMPONENT cis
	PORT MAP(
			d => s_rom_data,
			a => s_rom_addr,
			oe => s_rom_oe,
			cs => s_rom_cs,
			mode => s_rom_mode
		);

	s_rom_oe <= oe;
	s_rom_addr <= addr;
	s_rom_mode <= rom_mode;
	data <= s_rom_data;
	
	-- enable internal ROM when jumper shortened
	s_rom_cs <= s_ce_attr WHEN rom_internal='1' ELSE '1';
	-- pass through s_ce_attr signal to external chip if jumper open
	ce_attr_external <= s_ce_attr WHEN rom_internal='0' ELSE '1';

	-- generate control signals for SRAM chips
	ce_low <= '0' WHEN reg='1' AND ce1='0' ELSE '1';
	ce_upp <= '0' WHEN reg='1' AND ce2='0' ELSE '1';

	oe_even <= '0' WHEN reg='1' AND ce1='0' AND ce2='0' ELSE -- x16
		   '0' WHEN reg='1' AND ce1='0' AND ce2='1' AND a0='0' ELSE -- x8
		   '1';
			
	oe_odd <= '0' WHEN reg='1' AND ce1='0' AND ce2='0' ELSE -- x16
		  '0' WHEN reg='1' AND ce1='1' AND ce2='0' ELSE -- x8 
		  '1';				  
	-- separate output enable for odd byte on d7-d0
	oe_oddlow <= '0' WHEN reg='1' AND ce1='0' AND ce2='1' AND a0='1' ELSE -- x8
			'1';

	-- CE for attribute memory
	s_ce_attr <= '0' WHEN reg='0' AND ce1='0' AND ce2='0' ELSE
		     '0' WHEN reg='0' AND ce1='0' AND ce2='1' AND a0='0' ELSE
		     '1';
				
END behavioral;

