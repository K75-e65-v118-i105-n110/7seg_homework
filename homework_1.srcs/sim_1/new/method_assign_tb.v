`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 16:08:17
// Design Name: 
// Module Name: method_assign_tb
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



module method_assign_tb;    //数据流测试
    reg [1:0] bin;
    reg EN;
    wire [6:0] seg;

    method_assign u1(.bin(bin),
        .EN(EN),
        .seg(seg));


    initial begin
        $dumpfile("method_assiign_tb.vcd");
        $dumpvars(0,method_assign_tb);

        bin = 2'b00;
        EN = 1'b1;

        #20;
        bin = 2'b01;

        #20;
        bin = 2'b10;

        #20;
        bin = 2'b11;    //遍历数字输入

        #20;
        EN = 1'b0;      //使能信号测试
        
        #20;
        bin = 2'b00;

        #20;
        $finish;
    end

    initial begin
        $monitor("time=%0t bin=%b EN=%b seg=%b",$time,bin,EN,seg);

    end

endmodule
