#
# usage:  
#    $ make clean
#    $ make prog
#
# Be sure the pico-ice board is connected.
# 

# set to where ever the oss-cad-suite is installed
OSS_CAD_SUITE = /usr

YOSYS = $(OSS_CAD_SUITE)/bin/yosys
NEXTPNR = $(OSS_CAD_SUITE)/bin/nextpnr-ice40
ICETIME = $(OSS_CAD_SUITE)/bin/icetime
ICEPACK = $(OSS_CAD_SUITE)/bin/icepack
DFU_UTIL = $(OSS_CAD_SUITE)/bin/dfu-util
BIN2UF2 = bin2uf2
COPY = cp

all: pwm.bin pwm.uf2

prog: pwm.bin pwm.uf2
	$(COPY) pwm.uf2 /media/$(USER)/pico-ice

pwm.bin: pwm.v
	$(YOSYS) -q -p "synth_ice40 -top top -json $(basename $<).json" $<
	$(NEXTPNR) -q --up5k --package sg48 --asc $(basename $<).asc --pcf pico-ice.pcf --json $(basename $<).json
	$(ICETIME) -d up5k -c 25 $(basename $<).asc
	$(ICEPACK) $(basename $<).asc $(basename $<).bin

.bin.uf2:
	$(BIN2UF2) -o $@ $<

clean:
	$(RM) *.json *.asc *.bin *.uf2 *.log

.SUFFIXES: .v .sv .asc .bin .uf2