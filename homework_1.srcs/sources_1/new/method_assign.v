`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 11:40:04
// Design Name: 
// Module Name: method_assign
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


module method_assign(//数据流
    input [1:0] bin,//输入二进制数
    input EN,//使能信号
    output wire [6:0] seg
    );

    assign seg[0] = (~bin[1])&bin[0] | (~EN);
    assign seg[1] = 1'b0;
    assign seg[2] = bin[1]&(~bin[0])&EN;
    assign seg[3] = (~bin[1])&bin[0] | (~EN);
    assign seg[4] = bin[0] | (~EN) ;
    assign seg[5] = (bin[1]&EN) | (bin[0]&EN) ;
    assign seg[6] = (~bin[1])&EN ;
endmodule
