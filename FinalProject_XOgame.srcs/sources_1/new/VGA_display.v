`timescale 1ns / 1ps


module VGA_display(
    input wire clk_25MHz,
    input wire reset,
    output reg [15:0]sx,
    output reg [15:0]sy,
    output hsync,
    output vsync,
    output v_on
    );
    initial begin
        sx <= 0;
        sy <= 0;
    end
    parameter H_Display = 640;
    parameter H_L_Border = 48;
    parameter H_R_Border = 16;
    parameter H_Retrace = 96;
    parameter H_Max = H_Display + H_L_Border + H_R_Border + H_Retrace - 1;
    parameter Start_H_Retrace = H_Display + H_R_Border ;
    parameter End_H_Retrace = Start_H_Retrace + H_Retrace - 1;
    
    parameter V_Display = 480;
    parameter V_T_Border = 10;
    parameter V_B_Border = 33;
    parameter V_Retrace = 2;
    parameter V_Max = V_Display + V_T_Border + V_B_Border + V_Retrace - 1;
    parameter Start_V_Retrace = V_Display + V_B_Border ;
    parameter End_V_Retrace = Start_V_Retrace + V_Retrace - 1;
    
    assign hsync = ~(sx >= Start_H_Retrace & sx <= End_H_Retrace);
    assign vsync = ~(sy >= Start_V_Retrace & sy <= End_V_Retrace);
    
    always @(posedge clk_25MHz)
    begin
        if (sx == H_Max)
        begin
            sx <= 0;
            sy <= (sy == V_Max) ? 0 : sy + 1;
        end
        else
            sx <= sx+1;
        if (reset)
        begin
            sx <= 0;
            sy <= 0; 
        end
    end
    assign v_on = (sx < H_Display) && (sy < V_Display);
endmodule
