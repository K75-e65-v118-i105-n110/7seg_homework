`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/01 14:26:30
// Design Name: 
// Module Name: top_module_tb
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


module top_module_tb();
    reg [1:0] D;
    reg CE;
    reg EN;
    reg clk;
    reg rst;
    reg [1:0] sel;
    wire [6:0] seg;
    wire [3:0] pos;
    integer i;
    integer j;

    top_module dut (
        .D(D),
        .CE(CE),
        .EN(EN),
        .clk(clk),
        .rst(rst),
        .sel(sel),
        .seg(seg),
        .pos(pos)
    );

    always #5 clk = ~clk;   //产生时钟信号

    initial begin
        $dumpfile("top_module_tb.vcd");
        $dumpvars(0, top_module_tb);

        clk = 1'b0;
        D = 2'b00;
        CE = 1'b1;
        EN = 1'b1;
        rst = 1'b1;
        sel = 2'b00;

        #20;
        rst = 1'b0;

        for (i = 0; i < 4; i = i + 1) begin     //遍历每一种选择下的每一种数据
            sel = i;
            for (j = 0; j < 4; j = j + 1) begin
                D = j;
                #20;
            end
        end

        EN = 1'b0;      //使能信号测试
        #20;
        CE = 1'b0;      //显示开关测试
        #20;
        CE = 1'b1;
        EN = 1'b1;

        rst = 1'b1;     //复位信号测试
        #20;
        rst = 1'b0;
        #400100;      //扫描完整周期
        $finish;
    end

    initial begin
        $monitor("time=%0t clk=%b rst=%b sel=%b EN=%b D=%b CE=%b pos=%b seg=%b",
                 $time, clk, rst, sel, EN, D, CE, pos, seg);
    end

endmodule
