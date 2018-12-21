ppa-pcmcia-sram
===============

PCMCIA SRAM card created on ppa.pl forum.

* board - electrical schematics and board layout (Eagle, Gerber)
* cpld/src - CPLD core source (VHDL)
* docs - documentation (manual)

For history and rationale behind design decisions, See this thread: http://www.ppa.pl/forum/amiga/29264/budowa-kart-pamieci-sram-na-pcmcia

This board was sold and marketed as Sakura 4MB PCMCIA SRAM, primarily by Sakura IT, though several forks of this design exist.

Description
===========

Add 4MB of Fast RAM to your unexpanded Amiga 600/1200. This additional memory will make your system much faster and allow to run more demanding games and applications. It was designed by Jarosław Bieliński and Radosław Kujawa.

This memory expansion card has the following features:

* Adds 4MB of Fast RAM to Amiga 600 or Amiga 1200.
* Built using modern, high performance 55ns SRAM ICs (even faster than maximum Amiga 1200 slot access time).
* Accelerates unexpanded Amiga 1200 to at least 1.67 MIPS (according to SysInfo).
* Fully PCMCIA 2.1 compliant on an electrical level, smaller dimensions than normal PCMCIA card.
* Very simple installation - just insert the card into PCMCIA slot on the left side of Amiga.
* Compatible with all PCMCIA friendly accelerators and memory expansions.
* Open source design. 
* RoHS compliant, low power, environmentally friendly.
* Made by Amigans for Amigans!

We did our best to ensure that this card works on as many configurations as possible, but some accelerator and Fast RAM expansion designs are inherently incompatible with PCMCIA slot if more than 4MB of memory is installed. Note that PCMCIA SRAM should work with them anyway, if less than 4MB Fast was installed on the turbo card. Of course, if you don’t have any accelerator, you don’t have to worry about that.

The following A1200 cards are known to be PCMCIA compatible and should work correctly with any amount of memory installed:

* Blizzard 1230/1240/1260.
* Apollo 1240/1260.
* ACA 1220/1230/1231/1232.
* most other turbo cards supporting more than 8MB of Fast memory.
* 4MB Fast trapdoor expansions without CPU.

The following A1200 cards are known to be problematic if more than 4MB of memory is installed:

* Apollo/Elbox/Viper 1230LC.
* M-Tec 1230/28.
* Blizzard 1220 if more than 4MB RAM installed.
* 8MB Fast trapdoor expansions without CPU.

The following A600 cards are known to be PCMCIA compatible and should work correctly:

* ACA630.
* 4MB Fast expansions attached on top of processor.

The following A600 cards are known to be problematic if more than 4MB of memory is installed:

* ACA620 (in default PCMCIA-incompatible mode).
* Ninetails (in default PCMCIA-incompatible mode).
* 8MB/9.5MB Fast expansions attached on top of processor.

