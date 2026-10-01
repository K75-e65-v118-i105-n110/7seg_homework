`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/17 15:56:40
// Design Name: 
// Module Name: top_module
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


module top_module(
    input [1:0] D,//输入2位二进制数字
    input CE,//是否显示数字开关
    input EN,//使能开关，为0输出显示4
    input clk,//时钟信号
    input rst,//复位信号，按钮，按下复位，只有第一个显示管亮
    input [1:0] sel,//译码方法选择
    output [6:0] seg,//7段显示管
    output [3:0] pos//选位信号

    );

    wire [6:0] seg_out;



    module_select u4(   //译码并根据选择开关选择特定的译码方法
        .sel(sel),
        .EN(EN),
        .D(D),
        .sel_seg(seg_out)
    );

    scan u5(    //选位扫描
        .clk(clk),
        .rst(rst),
        .pos(pos)
    );

    out_none u6(    //不同选位显示不同的内容
        .seled_seg(seg_out),
        .CE(CE),
        .pos(pos),
        .seg(seg)
    );
    

endmodule
