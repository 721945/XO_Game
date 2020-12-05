`timescale 1ns / 1ps

module createCrossSign(
    input [15:0]current_x,current_y,x,y,
    output draw
    );
    wire squareBorder;
    wire [15:0] pos_x = current_x - x;
    wire [15:0] pos_y = current_y - y;
    localparam size = 5;
    createSquare sqBorder (current_x,current_y,x + 40 , y + 40 , 57 , 57 ,squareBorder);
    assign draw = squareBorder & ((pos_x - size <= pos_y & pos_y <= pos_x+size) | 
                    ( 137 - pos_x - size <= pos_y  & pos_y  <= 137 - pos_x + size));
endmodule
