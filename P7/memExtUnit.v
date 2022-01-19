`timescale 1ns / 1ps
`include "onehot.v"
module MemExtUnit(
    input   [31:0]  RawMemData,
    input   [1:0]   offset,
    input   [4:0]   loadType,
    output  [31:0]  ExtMemData
    );
    wire lb,lbu,lh,lhu,lw;
    assign {lb,lbu,lh,lhu,lw} = loadType;
    wire [31:0] offsetedata;
    assign offsetedata = RawMemData >> ({offset,3'b000});
    assign ExtMemData = lb ? {{24{offsetedata[7]}},offsetedata[7:0]} :
                        lbu ? {24'b0,offsetedata[7:0]} : 
                        lh ? {{16{offsetedata[15]}},offsetedata[15:0]} :
                        lhu ? {16'b0,offsetedata[15:0]} : offsetedata ;
                        
endmodule