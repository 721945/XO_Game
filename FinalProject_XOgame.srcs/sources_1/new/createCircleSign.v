`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2020 03:05:37 AM
// Design Name: 
// Module Name: createCircleSign
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module createCircleSign(
    input [15:0] current_x,
    input [15:0] current_y,
    input [15:0] x,
    input [15:0] y,
    output draw
    );
    localparam center = 67;
    localparam size = 5;
    localparam radius = 27;
    wire [15:0] pos_x = current_x - x - center + radius;
    wire [15:0] pos_y = current_y - y - center + radius;
    reg [15:0] pos_x_double;
    
    assign draw =  ((pos_x-radius)**2 + (pos_y-radius)**2 <= (radius)**2 ? 1 : 0);
endmodule
