#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

#define PCMCIA_COMMON_MEM_BASE	0x600000UL	/* SRAM base address */
#define PCMCIA_COMMON_MEM_SIZE	0x3FFFFFUL	/* SRAM size */
/*#define FAKEMODE	1*/

bool test_writeread(volatile uint16_t *addr, uint16_t val);

int main(int argc, char *argv[]) 
{
	volatile uint16_t *addr, *base;
	int i,j;

#ifdef FAKEMODE
	base = (volatile uint16_t*) malloc(PCMCIA_COMMON_MEM_SIZE);
	printf("fake buffer base address: %p\n", base);
#else
	base = (volatile uint16_t*) PCMCIA_COMMON_MEM_BASE;
	printf("PCMCIA memory base address: %p\n", base);
#endif
	addr = base;

	test_writeread(addr, 0);
	for(i = 0; i <= 0xF; i++) {
		if(!test_writeread(addr, 1<<i))
			printf("ERROR in test at %p\n", addr);
	}

	for(i = 0; i <= 21; i++) {
		addr = (volatile uint16_t*) ((uint64_t)base + (1<<i));  
		printf("%p, %x write %x\n", addr, 1<<i, i);
		*addr = i;
	}

	for(i = 0; i <= 21; i++) {
		addr = (volatile uint16_t*) ((uint64_t)base + (1<<i));  
		printf("in test at %p, got %x, exp. %x\n", addr, *addr, i);
		
	}
#ifdef FAKEMODE
	free((void *) base);
#endif
}

bool
test_writeread(volatile uint16_t *addr, uint16_t val) 
{
	uint16_t readback;

	printf("%p: WRITE -> %x\n", addr, val);
	*addr = val;

	readback = *addr;
	printf("%p: READ -> %x\n", addr, readback);

	if (readback != val)
		return false;

	return true;
}

