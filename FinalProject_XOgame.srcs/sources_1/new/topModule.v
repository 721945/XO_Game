
module topModule(
    input clock,
    input reset,
    output [3:0] VGA_red,
    output [3:0] VGA_green,
    output [3:0] VGA_blue,
    output VGA_hsync,
    output VGA_vsync
    );
    wire clk_25MHz;
    wire enable_V_counter;
    wire [15:0] current_x;
    wire [15:0] current_y;
    wire v_on;
    wire v_color;
    wire [3:0]r,g,b;
    wire [3:0]r1,g1,b1;
    wire isX = 0;
    clock_25mHz clk25mHz(clock,reset,clk_25MHz);
    
    
    createTable table1(current_x,current_y,r,g,b);

    
    VGA_display display(clk_25MHz,reset,current_x,current_y,VGA_hsync , VGA_vsync,v_on);
    assign VGA_red = v_on ? r : 4'h0;
    assign VGA_green = v_on ? g : 4'h0;
    assign VGA_blue = v_on  ? b : 4'h0; 
    
endmodule
