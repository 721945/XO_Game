`timescale 1ns / 1ps

module testbench;
    reg clock;
    wire reset;
    wire [3:0] VGA_red;
    wire [3:0] VGA_green;
    wire [3:0] VGA_blue;
    wire btnC,btnL,btnR,btnT,btnB;
    wire VGA_hsync;
    wire VGA_vsync;
    initial clock = 0;
    assign reset = 0;
    topModule UUT (clock,reset, btnC,btnL,btnR,btnT,btnB,VGA_red,VGA_green,VGA_blue,VGA_hsync,VGA_vsync);
    always #5 clock = ~clock;
endmodule
