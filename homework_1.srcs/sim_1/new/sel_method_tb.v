`timescale 1ns / 1ps
module sel_method_tb;   //译码方式选择测试
    reg [6:0] a_seg;
    reg [6:0] b_seg;
    reg [6:0] s_seg;
    reg [1:0] sel;
    wire [6:0] seg;

    module_select u1 (
        .sel(sel),
        .a_seg(a_seg),
        .b_seg(b_seg),
        .s_seg(s_seg),
        .sel_seg(seg)
    );

    initial begin
        $dumpfile("sel_method_tb.vcd");
        $dumpvars(0,sel_method_tb);

        a_seg = 7'b1000000;
        b_seg = 7'b0100000;
        s_seg = 7'b0010000; //用不同的值区分不同译码方式的输出
        sel = 2'b00;

        #20;
        sel = 2'b01;

        #20;
        sel = 2'b10;

        #20;
        sel = 2'b11;    //遍历每种选择

        #20;
        $finish;
    end

    initial begin
        $monitor("time%0t a_seg=%d b_seg=%d s_seg=%d sel=%d seg=%d",
        $time,a_seg,b_seg,s_seg,sel,seg);
    end


endmodule