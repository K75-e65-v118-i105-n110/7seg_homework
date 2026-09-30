`timescale 1ns / 1ps
module method_struct_tb ;   //结构化测试
    reg [1:0] bin;
    reg EN;
    wire [6:0] seg;

    method_struct u1(.bin(bin),
        .EN(EN),
        .seg(seg));

    initial begin
        $dumpfile("method_struct_tb.vcd");
        $dumpvars(0,method_struct_tb);

        bin = 2'b00;
        EN = 1'b1;

        #20;
        bin = 2'b01;

        #20;
        bin = 2'b10;

        #20;
        bin = 2'b11;    //遍历数字输入

        #20;
        EN = 1'b0;      //测试使能信号
        
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