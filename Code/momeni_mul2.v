`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:37:57 11/22/2020 
// Design Name: 
// Module Name:    momeni_mul2 
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
module momeni_mul2(
    input [7:0] A,
    input [7:0] B,
    output [15:0] P
    );


wire [7:0] PP1,PP2,PP3,PP4,PP5,PP6,PP7,PP8;
wire [14:0] R1,R2,R3,R4;
wire [14:0] F1,F2;

//PPG
and p1[7:0](PP1,A,B[0]);
and p2[7:0](PP2,A,B[1]);
and p3[7:0](PP3,A,B[2]);
and p4[7:0](PP4,A,B[3]);
and p5[7:0](PP5,A,B[4]);
and p6[7:0](PP6,A,B[5]);
and p7[7:0](PP7,A,B[6]);
and p8[7:0](PP8,A,B[7]);

//L1
//Approx
assign R1[3:0] = PP1[3:0];
assign R2[3:1] = PP2[2:0];
assign R3[3:2] = PP3[1:0];
assign R4[3] = PP4[0];

h_add h1(PP1[4],PP2[3],R4[4],R1[5]);
assign R1[4] = PP3[2];
assign R2[4] = PP4[1];
assign R3[4] = PP5[0];

comp2 c1(PP1[5],PP2[4],PP3[3],PP4[2],R4[5],R1[6]);
assign R2[5] = PP5[1];
assign R3[5] = PP6[0];

comp2 c2(PP1[6],PP2[5],PP3[4],PP4[3],R4[6],R2[7]);
h_add h2(PP5[2],PP6[1],R3[6],R1[7]);
assign R2[6] = PP7[0];

comp2 c3(PP1[7],PP2[6],PP3[5],PP4[4],R4[7],R1[8]);
comp2 c4(PP5[3],PP6[2],PP7[1],PP8[0],R3[7],R2[8]);

comp2 c5(PP2[7],PP3[6],PP4[5],PP5[4],R4[8],R2[9]);
f_add f1(PP6[3],PP7[2],PP8[1],R3[8],R1[9]);

comp2 c6(PP3[7],PP4[6],PP5[5],PP6[4],R4[9],R2[10]);
h_add h3(PP7[3],PP8[2],R3[9],R1[10]);

comp2 c7(PP4[7],PP5[6],PP6[5],PP7[4],R4[10],R1[11]);
assign R3[10] = PP8[3];

h_add h4(PP5[7],PP6[6],R4[11],R1[12]);
assign R2[11] = PP7[5];
assign R3[11] = PP8[4];

assign R2[12] = PP6[7];
assign R3[12] = PP7[6];
assign R4[12] = PP8[5];

assign R1[13] = PP7[7];
assign R2[13] = PP8[6];

assign R1[14] = PP8[7];

//L2
assign F1[1:0] = R1[1:0];
assign F2[0] = 0;
assign F2[1] = R2[1];

h_add h5(R1[2],R2[2],F1[2],F2[3]);
assign F2[2] = R3[2];

h_add h6(R1[13],R2[13],F1[13],F2[14]);
assign F1[14] = R1[14];

genvar i;
for(i=3;i<=12;i=i+1)
begin : comp_L2
comp2 cc1(R1[i],R2[i],R3[i],R4[i],F1[i],F2[i+1]);
end

assign P = F1+F2;

endmodule
