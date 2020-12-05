`timescale 1ns / 1ps
module Xsign(
    input [15:0]current_x,
    input [15:0]current_y,
    input [15:0]x,
    input [15:0]y,
    output draw
    );
    wire [15:0] shift_x = current_x - x;
    wire [15:0] shift_y = current_y - y;
    wire isBorder;
    localparam thickness = 5;
    createSquare border (current_x,current_y,40,40,67,67,isBorder);
//    assign draw = 1;
    wire crossLine = 0;
    assign crossLine = current_x == current_y ? 1 : 0;
//    assign draw = isBorder & (current_x == current_y ?  1 : 0);
endmodule