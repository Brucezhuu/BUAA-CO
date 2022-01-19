`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:24 11/03/2021 
// Design Name: 
// Module Name:    test 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module test(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    reg [2:0] state;
    reg [31:0] cnt;
    parameter s0 = 3'b000;
    parameter s1 = 3'b001;
    parameter s2 = 3'b010;
    parameter s3 = 3'b011;
    parameter s4 = 3'b100;
    initial begin
       state = s0;
        cnt = 32'd0;
    end
    always @(posedge clk) begin
        if(reset) begin
           state <= s0;
           cnt <= 32'd0;
        end else begin
            case (state) 
                s0 : begin
                   state <= in ? s1 : s0; 
                end
                s1 :begin
                    cnt = cnt + 32'd1;
                    if(cnt < 32'd6 && in) begin
                       state <= s1;
                    end
                    else if(cnt < 32'd6 && ~in) begin
                       cnt <= 32'd0;
                        state <= s4;
                    end
                    else if(cnt == 32'd6 && in) begin
                       cnt <= 32'd0;
                       state <= s2;
                    end
                    else if(cnt == 32'd6 && ~in) begin
                       cnt <= 32'd0;
                        state <= s3;
                    end
                end
                s2: begin
                    state <= in ? s2 : s0;
                end
                s3 :begin
                   state <= in ? s1 : s0; 
                end
                s4 : begin
                    state <= in ? s1 : s0;
                end
                default : state <= s0;
            endcase
        end
    end
    assign flag = (state == s3);
    assign disc = (state == s4);
    assign err = (state == s2);
endmodule

