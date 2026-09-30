`timescale 1ns / 1ps
module method_behavior_tb ;//行为化译码测试
    reg [1:0] bin;
    reg EN;
    wire [6:0] seg;

    method_behavior u1(.bin(bin),
        .EN(EN),
        .seg(seg));

    initial begin
        $dumpfile("method_behavior_tb.vcd");
        $dumpvars(0,method_behavior_tb);
        bin = 2'b00;
        EN = 1'b1;

        #20;
        bin = 2'b01;

        #20;
        bin = 2'b10;

        #20;
        bin = 2'b11;    //遍历输入的每种情况

        #20;
        EN = 1'b0;  //使能信号测试
        
        #20;
        bin = 2'b00;    

        #20;
        $finish;
    end

    initial begin
        $monitor("time=%0t bin=%d EN=%d seg=%d",
        $time,bin,EN,seg);

    end
endmodule