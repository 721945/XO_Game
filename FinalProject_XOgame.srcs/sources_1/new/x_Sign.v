`timescale 1ns / 1ps

module x_Sign(
    input [15:0]current_x,current_y,x,y,
    output draw
    );
    wire isinBorder = 0;
    localparam thickness = 5;
    createSquare border (current_x,current_y,x + 40,y + 40, 57,57,isinBorder);
    assign draw = isinBorder;
endmodule
