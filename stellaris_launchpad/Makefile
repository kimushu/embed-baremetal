#================================================================================
# Makefile for baremetal environment (Cortex-M4F)
#================================================================================

CROSS_COMPILE = arm-none-eabi-

CC = $(CROSS_COMPILE)gcc
LD = $(CROSS_COMPILE)gcc
OC = $(CROSS_COMPILE)objcopy
OD = $(CROSS_COMPILE)objdump

TARGET = output
SOURCE_CC = main.c
SOURCE_AS = start.S
LDS = lm4f.ld
OBJECT = $(SOURCE_CC:.c=.o) $(SOURCE_AS:.S=.o)

CFLAGS = -Wall -mcpu=cortex-m4 -mthumb -nostartfiles
LDFLAGS = $(CFLAGS)

all: $(TARGET).bin

$(TARGET).elf: $(LDS) $(OBJECT)
	$(LD) -o $@ $(LDFLAGS) -T $^

%.bin: %.elf
	$(OC) -O binary $< $@

%.o: %.c $(MAKEFILE_LIST)
	$(CC) -o $@ -c $(CFLAGS) $<

%.o: %.S $(MAKEFILE_LIST)
	$(CC) -o $@ -c $(CFLAGS) $<

.PHONY: clean
clean:
	rm -f $(TARGET).{bin,elf} $(OBJECT)

