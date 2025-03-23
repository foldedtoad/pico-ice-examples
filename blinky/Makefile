#
# usage:  
#    $ make clean
#    $ sudo make prog
#
# Be sure the pico-ice board is connected.
# 
YOSYS = $(OSS_CAD_SUITE)/bin/yosys
NEXTPNR = $(OSS_CAD_SUITE)/bin/nextpnr-ice40
ICEPACK = $(OSS_CAD_SUITE)/bin/icepack
DFU_UTIL = $(OSS_CAD_SUITE)/bin/dfu-util
BIN2UF2 = bin2uf2

RTL = top.sv

all: blinky.bin

clean:
	$(RM) *.json *.asc *.bin *.uf2

prog: blinky.bin
	$(DFU_UTIL) -d 1209:b1c0 -a 1 -D blinky.bin -R

blinky.bin: $(RTL)
	$(YOSYS) -q -p "read_verilog -sv $(RTL); synth_ice40 -top top -json $*.json"
	$(NEXTPNR) -q --randomize-seed --up5k --package sg48 --pcf ice40.pcf --json $*.json --asc $*.asc
	$(ICEPACK) $*.asc $@

.bin.uf2:
	$(BIN2UF2) -o $@ $<

.SUFFIXES: .v .sv .asc .bin .uf2
