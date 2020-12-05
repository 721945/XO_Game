`timescale 1ns / 1ps

module clock_25mHz(
    input clock,
    input reset,
    output reg divided_clock
    );
    localparam divider = 2; // change to 
    integer counter = 0;
    initial divided_clock = 0 ;
    always @(posedge clock , posedge reset)
    begin
        if (reset || counter == divider -1)
            counter <= 0;
        else
            counter <= counter + 1;
    end
    always @(posedge clock)
    begin
        // from 100mHz to 50 mHz and divider is 1 is mean it can be 0 and 1 so it's divded by 2 = 25mHz
        if (counter == divider-1)
            divided_clock <= ~divided_clock;
        else
            divided_clock <= divided_clock;
    end
endmodule
