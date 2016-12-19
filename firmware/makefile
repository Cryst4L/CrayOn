# This Makefile defines the standard rules for building FX2 projects.
.PHONY: all ihx clean
.SUFFIXES: .ihx .c

INCLUDES=-I include/
SDCC=bin/bmpsdcc.sh
IHXTARGETS=transceiver.ihx
IHXEXTRADEPS= *.lk *.rel *.sym *.tmp.c *.rst *.mem *.lst *.map

all : ihx 

ihx : $(IHXTARGETS)

%.ihx: %.c 
	$(SDCC) $< "$(INCLUDES)"
	
clean:
	$(RM) $(IHXEXTRADEPS)

