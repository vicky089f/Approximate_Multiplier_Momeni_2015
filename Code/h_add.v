`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:05 03/16/2020 
// Design Name: 
// Module Name:    h_add 
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
module h_add(
    input a,
    input b,
    output s,
    output c
    );

xor g1(s,a,b);
and g2(c,a,b);
endmodule