//
//`default_nettype none
//`timescale 10 ns / 1 ns

module main_tb;
 
 // Simulation time: 100ns (10 * 10ns)
 parameter DURATION = 10;
 
 // Input/Output
 reg ICE_PB = 0;
 wire LED_R;

 // Module instance
 main MAIN (
  ICE_PB,
  LED_R
 );
 
 initial begin
  // Dump vars to the output .vcd file
  $dumpvars(0, main_tb);
 

  #10 BUTTON=1;
  #10 BUTTON=0;
  #10 BUTTON=1;
  #10 BUTTON=0;

  $display("End of simulation");
  $finish;
 end
 
endmodule
