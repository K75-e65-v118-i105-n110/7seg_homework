`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/23 11:40:04
// Design Name: 
// Module Name: method_behavior
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


module method_behavior(
    input [1:0] bin,
    input EN,
    output reg [6:0] seg
    );

    always @(*) begin
        if(!EN) seg = 7'b0011001; //使能端为0，七段译码器输出显示4
        else begin
            case(bin)   //使能端为1，输入数据译码
            4'b00: seg = 7'b1000000;
            4'b01: seg = 7'b1111001;
            4'b10: seg = 7'b0100100;
            4'b11: seg = 7'b0110000;
            default: seg = 7'b1111111;
            endcase
            end
        end
endmodule
