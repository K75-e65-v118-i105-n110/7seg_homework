`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 15:40:10
// Design Name: 
// Module Name: out_none
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


module out_none(    //根据选位选择输出结果
    input [3:0] pos,    //选位信号
    input [6:0] seled_seg,  //译码后结果
    input CE,   //开关信号
    output reg [6:0] seg    //最终输出给7段显示管的结果
    );

    always @(*) begin
        if(!CE) seg = 7'b0111111;   //开关对开显示管显示一个横杠
        else begin
        case(pos)   //如果选择第一位则输出译码后结果，如果选择其他位就输出一个横杠的显示
            4'b1110: seg = seled_seg;
            default: seg = 7'b0111111;
        endcase 
        end
    end

endmodule
