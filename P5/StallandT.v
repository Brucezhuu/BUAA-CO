`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:34 12/11/2021 
// Design Name: 
// Module Name:    StallandT 
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
module StallandT(
    input [31:0] instr,
    input [`Bitwidth] onehot,
    input [2:0] D_tnew,
    input [2:0] E_tnew,
    input [4:0] D_A3,
    input [4:0] E_A3,
    input D_RFWR,
    input E_RFWR,
    input [4:0] rs,
    input [4:0] rt,
    output stall,
    output [2:0] tnew
    );
    wire `insbus;
//  `define Bitwidth 17:0
//  `define insbus nop,addu, addi, subu, ori, lw, lh, lb, sw, sh, sb, beq, lui, j, jal, jalr, jr, sll
    wire read_rs;
    wire read_rt;
    assign read_rs = addu | addi | subu | ori | lw | lh | lb | sw | sh | sb | beq | jr | jalr;
    assign read_rt = addu | subu | sw | sh | sb | beq | sll;
    assign {`insbus} = onehot;
    wire rs_Tuse;
    assign rs_Tuse = (addu | subu | ori | lw | lh | lb | sw | sh | sb | addi ) ? 1:
                (beq | jr | jalr ) ? 0:
                                0;
    wire [1:0] rt_Tuse;
    assign rt_Tuse = (addu | subu | sll ) ? 2'b01 :
                    (sb | sh | sw) ? 2'b10 :
                    (beq) ? 2'b00 : 2'b00;
    wire stall_rs;
    wire stall_rt;
    assign stall = ( stall_rs || stall_rt );
    assign stall_rs = (read_rs && rs != 5'b0) && ((D_tnew > rs_Tuse && D_RFWR && D_A3 == rs) || (E_tnew > rs_Tuse && E_RFWR && E_A3 == rs));
    assign stall_rt = (read_rt && rt != 5'b0) && ((D_tnew > rt_Tuse && D_RFWR && D_A3 == rt) || (E_tnew > rt_Tuse && E_RFWR && E_A3 == rt));
    assign tnew = (addu | subu | ori | addi | lui | sll | jal | jalr ) ? 3'd2 :
                    (lw | lb | lh ) ? 3'd3 : 3'd4; // 第二级流水线的tnew不可能为0

endmodule
