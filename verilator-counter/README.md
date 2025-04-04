# verilator_counter

Example project using a standard [Makefile](https://en.wikipedia.org/wiki/Make_%28software%29)
to build a project with a [Verilator](https://verilator.org/) simulation test bench.

It needs [oss-cad-suite](https://github.com/YosysHQ/oss-cad-suite-build) installed.
See the [doc](https://pico-ice.tinyvision.ai/using_oss_cad_suite.html) for more.

It also requires a C++ compiler, to compile the Verilator simulation, converted from Verilog to C++.

Build with `make`. This should simulate the design, producing a `verilator.vcd` that can be browsed with `gtkwave verilator.vcd`.

`ice40.sv` wraps `top.sv` and can be deployed to the pico-ice with `sudo make prog`, and `make gateware.uf2` to generate an
[uf2 image](https://pico-ice.tinyvision.ai/programming_the_fpga.html#using-a-drag-drop-or-file-copy-scheme)
to program with drag-and-drop.
