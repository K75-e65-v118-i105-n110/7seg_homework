`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 11:40:04
// Design Name: 
// Module Name: module_select
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


module module_select(   //译码并在三个方法里选择
    input [1:0] sel,
    input EN,
    input [1:0] D,
    output reg [6:0] sel_seg
    );

    wire [6:0] a_seg;
    wire [6:0] b_seg;
    wire [6:0] s_seg;

    method_struct u1 ( //结构化方法译码
        .bin(D),
        .EN(EN),
        .seg(s_seg)
    );

    method_behavior u2 (    //行为级描述译码
        .bin(D),
        .EN(EN),
        .seg(b_seg)
    );

    method_assign u3 (  //数据流描述译码
        .bin(D),
        .EN(EN),
        .seg(a_seg)
    );

    always @(*) begin
        case(sel)
            2'd0: sel_seg = a_seg;//数据流
            2'd1: sel_seg = b_seg;//行为
            2'd2: sel_seg = s_seg;//结构化
            default: sel_seg = s_seg;//默认用结构化描述
        endcase
    end

endmodule
