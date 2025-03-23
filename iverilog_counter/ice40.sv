`timescale 1ns / 1ps
`default_nettype none

module ice40 (
    input CLK,
    output LED_R,
    output LED_G,
    output LED_B
);

    top top0 (
        .clk_i(CLK),
        .rst_ni(1),
        .cnt_o({ LED_R, LED_G, LED_B }),
    );

endmodule
