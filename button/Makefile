#
# 
PROJ = button
MODULES = button_tb.v

PIN_DEF = pico-ice.pcf
DEVICE = up5k
PACKAGE = sg48

COPY = cp

all: $(PROJ).bin $(PROJ).uf2

%.json: %.v $(MODULES)
	yosys -q -l $*.log -p 'synth_ice40 -top top -json $@' $< $(MODULES)
	@echo "******* yosys done"	

%.asc: $(PIN_DEF) %.json
	nextpnr-ice40 -q --$(DEVICE) \
		$(if $(PACKAGE),--package $(PACKAGE)) \
		--json $(filter-out $<,$^) \
		--pcf $< \
		--asc $@ \
		$(if $(PNR_SEED),--seed $(PNR_SEED))
	@echo "******* nextpnr done"

%.bin: %.asc
	icepack $< $@
	@echo "******* icepack done"

.bin.uf2:
	bin2uf2 -o $@ $<
	@echo "******* bin2uf2 done"	

prog: $(PROJ).bin $(PROJ).uf2
	$(COPY) $(PROJ).uf2 /media/$(USER)/pico-ice
	@echo "******* firmware update done"	

clean:
	$(RM) *.json *.asc *.bin *.uf2 *.log

.SUFFIXES: .v .sv .asc .bin .uf2