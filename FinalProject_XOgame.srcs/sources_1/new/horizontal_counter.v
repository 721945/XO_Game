`timescale 1ns / 1ps

module horizontal_counter(
    input clk_25MHz,
    output reg enable_V_counter = 0,
    output reg [15:0] H_counter = 0
    );
    always @(posedge clk_25MHz)
    begin
        if(H_counter < 799)
        begin
            H_counter <= H_counter + 1 ;
            enable_V_counter <= 0;
        end
        else
        begin
            H_counter <= 0;
            enable_V_counter <= 1;
        end        
       
    end
endmodule
