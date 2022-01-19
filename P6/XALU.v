`timescale 1ns / 1ps
`include "onehot.v"

module XALU(
    input clk,
    input reset,
    input [`Bitwidth] onehot,
    input [31:0] XALU_A,
    input [31:0] XALU_B,
    output reg [31:0] XALU_HI,
    output reg [31:0] XALU_LO,
    output XALU_Busy
    );

    wire `insbus;
    assign {`insbus} = onehot;

    reg busy;
    reg [3:0] cnt;
    reg [31:0] tmp_hi,tmp_lo;
    wire start = (mult | multu | div | divu);
    assign XALU_Busy = start | busy;
    initial begin
        busy = 0;
        cnt = 4'h0;
        XALU_HI = 32'h0;
        XALU_LO = 32'h0;
        tmp_hi = 32'h0;
        tmp_lo = 32'h0;
    end
    always @(posedge clk) begin
        if(reset) begin
            cnt <= 4'h0;
            busy <= 0;
            XALU_HI <= 32'h0;
            XALU_LO <= 32'h0;
            tmp_hi <= 32'h0;
            tmp_lo <= 32'h0;
        end 
        else begin
            if(cnt <= 4'h0)  begin
                if(mthi) XALU_HI <= XALU_A;
                else if(mtlo) XALU_LO <= XALU_A;
                else if(mult) begin
                    busy <= 1;
                    cnt <= 4'd5;
                    {tmp_hi,tmp_lo} <= $signed(XALU_A) * $signed(XALU_B);
                end
                else if(multu) begin
                    busy <= 1;
                    cnt <= 4'd5;
                    {tmp_hi,tmp_lo} <= XALU_A * XALU_B;
                end
                else if(div) begin
                    busy <= 1;
                    cnt <= 4'd10;
                    tmp_hi <= $signed(XALU_A) % $signed(XALU_B);
                    tmp_lo <= $signed(XALU_A) / $signed(XALU_B);
                end
                else if(divu) begin
                    busy <= 1;
                    cnt <= 4'd10;
                    tmp_hi <= XALU_A % XALU_B;
                    tmp_lo <= XALU_A / XALU_B;
                end 
            end
            else if(cnt == 4'd1) begin
                busy <= 0;
                cnt <= cnt - 4'd1;
                XALU_HI <= tmp_hi;
                XALU_LO <= tmp_lo;
            end 
            else begin
                cnt <= cnt - 4'd1;
            end
        end
    end

endmodule