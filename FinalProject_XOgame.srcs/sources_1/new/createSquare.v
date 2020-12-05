`timescale 1ns / 1ps

module createSquare(
    input [15:0]current_x,
    input [15:0]current_y,
    input [15:0]x,
    input [15:0]y,
    input [15:0]width,
    input [15:0]height,
    output draw
    );
   assign draw = (current_x > x )& (current_x < x+width) & (current_y > y )&( current_y < y+height);
endmodule
