`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 11:40:04
// Design Name: 
// Module Name: method_struct
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module method_struct(   //结构化
    input [1:0] bin,
    input EN,
    output wire [6:0] seg
    );
    
    wire bn_1,//bin[1]非
    bn_0,//bin[0]非
    EN_n,//EN非
    b_and,//bin[0]&bin[1]
    bn1_b0_and,//(~bin[1])&bin[0]
    b1_EN_and,//bin[1]&EN
    b0_EN_and;//bin[0]&EN

    not(bn_1,bin[1]);
    not(bn_0,bin[0]);
    not(EN_n,EN);
    and(b_and,bin[0],bin[1]);
    and(bn1_b0_and,bn_1,bin[0]);
    and(b1_EN_and,bin[1],EN);
    and(b0_EN_and,bin[0],EN);

    or(seg[0],bn1_b0_and,EN_n);
    or(seg[1],1'd0,1'd0);
    and(seg[2],bin[1],bn_0,EN);
    or(seg[3],bn1_b0_and,EN_n);
    or(seg[4],bin[0],EN_n);
    or(seg[5],b1_EN_and,b0_EN_and);
    and(seg[6],bn_1,EN);
    
    
endmodule