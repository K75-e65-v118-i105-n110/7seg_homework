`timescale 1ns/1ps
module scan_out_tb ;    //扫描及选位输出测试
    reg clk;
    reg rst;
    reg [6:0] seled_seg;
    reg CE;
    wire [3:0] pos;
    wire [6:0] seg;

    scan u1 (.clk(clk),
    .rst(rst),
    .pos(pos));

    out_none u2 (.pos(pos),
    .seled_seg(seled_seg),
    .CE(CE),
    .seg(seg));
    
    initial begin
        clk = 1'b0;
    end
    always #5 clk = ~clk;

    initial begin
        $dumpfile("scan_out_tb.vcd");
        $dumpvars(0,scan_out_tb);

        rst = 1'b0;
        seled_seg = 7'b0101001;
        CE = 1'b1;      //初始化，假设一个译码结果

        #8000;      //由于计数器需技术到一万才会移位一次，所以时延设定较长
        rst = 1'b1;     //复位信号测试

        #8000;
        rst = 1'b0;

        #8000;
        CE = 1'b0;  //开关信号测试

        #8000;
        CE = 1'b1;

        #8000;//在上述测试的同时，选位会左移四次，同时可以观察是否正确移位
        $finish;

    end

    initial begin
        $monitor("time=%0t clk=%d rst=%d seled_seg=%d CE=%d pos=%d seg=%d",
        $time,clk,rst,seled_seg,CE,pos,seg);
    end

endmodule