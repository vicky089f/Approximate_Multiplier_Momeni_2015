`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:26:31 03/16/2020 
// Design Name: 
// Module Name:    f_add 
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
module f_add(
    input a,
    input b,
    input cin,
    output sum,
    output cout
    );
wire s1,c1,c2;

xor g1(s1,a,b);
and g2(c1,a,b);
xor g3(sum,s1,cin);
and g4(c2,s1,cin);
or g5(cout,c1,c2);

endmodule