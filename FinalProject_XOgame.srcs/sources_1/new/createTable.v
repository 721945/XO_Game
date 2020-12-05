`timescale 1ns / 1ps

module createTable(
    input [15:0]x,
    input [15:0]y,
    output [3:0]r,
    output [3:0]g,
    output [3:0]b
    );
    wire d1;
    wire r1,r2,r3,r4;
    wire c1,c2,c3,c4;
    wire isX;
    localparam startY = 16;
    localparam startX = 8;
    wire cross1,cross2,cross3,cross4,cross5,cross6,cross7,cross8,cross9;
    wire circle1,circle2,circle3,circle4,circle5,circle6,circle7,circle8,circle9;
    
    // Horizontal Line [Row]
    createSquare s1(x,y,startX + 20,startY + 20,400,2,r1);
    createSquare s2(x,y,startX + 20,startY + 153,400,2,r2);
    createSquare s3(x,y,startX + 20,startY + 286,400,2,r3);
    createSquare s4(x,y,startX + 20,startY + 419,400,2,r4);
    // Vertical Line [Column]
    createSquare s5(x,y,startX + 20,startY + 20,2,400,c1);
    createSquare s6(x,y,startX + 153,startY + 20,2,400,c2);
    createSquare s7(x,y,startX + 286,startY + 20,2,400,c3);
    createSquare s8(x,y,startX + 419,startY + 20,2,402,c4);
    
//    createSquare xsign(x,y,startX + 20+40 , startY+20+40,57,57,isX);    
    createCrossSign crossSign1(x,y,startX + 20, startY + 20 , cross1);
    createCrossSign crossSign2(x,y,startX + 20, startY + 153 , cross2);
    createCrossSign crossSign3(x,y,startX + 20, startY + 286 , cross3);
    createCrossSign crossSign4(x,y,startX + 153, startY + 20 , cross4);
    createCrossSign crossSign5(x,y,startX + 153, startY + 153 , cross5);
    createCrossSign crossSign6(x,y,startX + 153, startY + 286 , cross6);
    createCrossSign crossSign7(x,y,startX + 286, startY + 20 , cross7);
    createCrossSign crossSign8(x,y,startX + 286, startY + 153 , cross8);
    createCrossSign crossSign9(x,y,startX + 286, startY + 286 , cross9);
    
    
    text_test text(x,y,233,187,d1);
    createCircleSign circleSign1(x,y,startX + 20, startY + 20 , circle1);
    createCircleSign circleSign2(x,y,startX + 20, startY + 153 , circle2);
    createCircleSign circleSign3(x,y,startX + 20, startY + 286 , circle3);
    createCircleSign circleSign4(x,y,startX + 153, startY + 20 , circle4);
    createCircleSign circleSign5(x,y,startX + 153, startY + 153 , circle5);
    createCircleSign circleSign6(x,y,startX + 153, startY + 286 , circle6);
    createCircleSign circleSign7(x,y,startX + 286, startY + 20 , circle7);
    createCircleSign circleSign8(x,y,startX + 286, startY + 153 , circle8);
    createCircleSign circleSign9(x,y,startX + 286, startY + 286 , circle9);
//    x_Sign xsign1 (x , y,36,36,isX);
    wire tables;
    wire allCross,allCircle;
    assign allCross = cross1 | cross2 | cross3 | cross4 | cross5 | cross6 | cross7 | cross8 | cross9;
    assign allCircle = circle1 | circle2 | circle3 | circle4 | circle5 | circle6 | circle7 | circle8 | circle9;
    assign tables = r1 | r2 | r3 | r4 | c1 | c2 | c3 | c4;
    assign r = {4{tables}} | {4{allCross}};
    assign g = {4{tables}};
    assign b = {4{tables}} | {4{allCircle}};

endmodule
