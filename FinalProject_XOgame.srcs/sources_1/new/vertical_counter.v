`timescale 1ns / 1ps

module vertical_counter(
    input clk_25MHz,
    input enable_V_counter,
    output reg [15:0] V_counter
    );
    initial V_counter = 0;
    always @(posedge clk_25MHz)
    begin
        if(V_counter < 524)
        begin
            if (enable_V_counter == 1'b1)
                V_counter <= V_counter + 1 ;
        end
        else
            V_counter <= 0;
    end
endmodule
