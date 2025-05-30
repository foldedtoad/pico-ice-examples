module top (
	input  CLK,
	output LED_G, LED_B, LED_R
);
	localparam LOG2DELAY = 22;

	reg [LOG2DELAY-1:0] counter = 0;
	reg [3:0] counter2 = 0;
	reg state = 0;

	always @(posedge CLK) begin
		counter <= counter + 1;
		counter2 <= counter2 + !counter;
		state <= state ^ !counter;
	end

	assign LED_G = state;
	assign LED_B = state;
	assign LED_R = state;

	SB_WARMBOOT WB (
		.BOOT(&counter2),
		.S1(1'b 0),
		.S0(1'b 0)
	);
endmodule
