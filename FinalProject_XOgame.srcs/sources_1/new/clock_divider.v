`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 12:24:57 PM
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input clock,
    output divided_clock
    );
    parameter divider = 4999;
    integer counter = 0;
    always @(posedge clock)
    begin
        if (counter == divider)
            counter <= 0;
        else
            counter <= counter + 1;
    end
    
endmodule
