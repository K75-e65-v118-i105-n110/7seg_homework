`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 15:08:59
// Design Name: 
// Module Name: scan
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


module scan(    //选位扫描，clk为100MHz，刷新率为250Hz
    input clk,
    input rst,
    output reg [3:0] pos
    );

    reg [13:0] count;//计数器

    always @(posedge clk) begin
        if(rst) begin   //复位信号，按下count置零，pos选位至第一位
            count <= 14'd0;
            pos <= 4'b1110;
        end
        else if(count == 14'd10_000) begin //count计数10_000，pos信号循环左移，每秒左移1_000次，刷新率即为250Hz
            pos <= {pos[2:0],pos[3]};
            count <= 14'd0;
        end
        else begin
            count <= count + 1; //计数
        end
    end
endmodule
