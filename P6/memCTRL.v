`timescale 1ns / 1ps
`include "onehot.v"
module MemCtrlUnit(
    input   [`Bitwidth]  onehot,
    input   [1:0]   offset,   
	output  [4:0]   loadType,
    output  [3:0]   byteen,
    output  aboutDM
    );
    wire `insbus;
    assign {`insbus} = onehot;
    assign	loadType = {lb,lbu,lh,lhu,lw};
    assign aboutDM = lb|lbu|lh|lhu|lw|sb|sh|sw;
    assign byteen = sw ? 4'b1111 : 
                    sb ? (4'b0001 << offset):
                    sh ? (4'b0011 << offset) : 4'b0000;

endmodule