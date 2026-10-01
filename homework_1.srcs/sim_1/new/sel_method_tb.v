`timescale 1ns / 1ps
module sel_method_tb;   //三种译码结果及选择测试
    reg [1:0] sel;
    reg EN;
    reg [1:0] D;
    wire [6:0] sel_seg;
    integer i;

    module_select u1 (
        .sel(sel),
        .EN(EN),
        .D(D),
        .sel_seg(sel_seg)
    );

    initial begin
        $dumpfile("sel_method_tb.vcd");
        $dumpvars(0,sel_method_tb);

        EN = 1'b1;
        sel = 2'b00;
        D = 2'b00;
        i = 0;

        for(i = 0; i < 4; i = i +1) begin   //遍历四种选择，在每种选择下，查看不同数据输入的译码正确性
            #20;
            D = 2'b01;

            #20;
            D = 2'b10;

            #20;
            D = 2'b11;      //遍历数据输入

            #20;
            EN = 1'b0;      //使能端测试

            #20;
            D = 2'b00;

            #20;
            EN = 1'b1;

            #20;
            sel = sel + 1;

        end

        #20;
        $finish;
    end

    initial begin
        $monitor("time%0t sel=%d EN=%d D=%d sel_seg=%d",
        $time,sel,EN,D,sel_seg);
    end


endmodule