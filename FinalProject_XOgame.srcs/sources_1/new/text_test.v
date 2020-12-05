`timescale 1ns / 1ps
module text_test(
input [15:0]current_x,
input [15:0]current_y,
input [15:0]x,
input [15:0]y,
output draw
    );
    wire square;
    wire [9:0] x_pos = current_x - x;
    wire [8:0] y_pos = current_y - y;
    createSquare square_1(current_x, current_y, x,y,298,103,square);
    assign draw = square & ((x_pos > 200) & (x_pos < 206));

endmodule