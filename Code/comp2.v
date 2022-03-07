`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:11 11/22/2020 
// Design Name: 
// Module Name:    comp2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comp2(
    input X1,
    input X2,
    input X3,
    input X4,
    output Sum,
    output Carry
    );

nor n1(c1,X1,X2);
nor n2(c2,X3,X4);
nor n3(Carry,c1,c2);

xnor x1(s1,X1,X2);
xnor x2(s2,X3,X4);
or x3(Sum,s1,s2);

endmodule
