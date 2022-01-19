`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:42:53 12/11/2021 
// Design Name: 
// Module Name:    ID_EX 
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
module ID_EX(
    input clk,
    input reset,
    input [31:0] I_pc,
    input [31:0] I_pc_pass,
    input [31:0] I_instr,
    input [31:0] pc_W,
    input [4:0] A3_W,
    input [31:0] WD_W,
    input RFWR_W,
    input E_RFWR,
    input [31:0] E_WD,
    input [4:0] E_A3,
    input [2:0] E_tnew,
	input E_Busy,

    input [3:0] D_excCode,
    input req,
    input D_bdin,
    input [4:0] M_rd_addr,
    input M_mtc0,
    input [31:0] EPC,

    output [31:0] npc_pass,
    output reg [`Bitwidth] D_onehot,
    output reg [31:0] D_RD1,
    output reg [31:0] D_RD2,
    output reg [4:0] D_A1,
    output reg [4:0] D_A2,
    output reg D_RFWR,
    output reg [31:0] D_pc,
    output reg [4:0] D_A3,
    output D_stall,
    output reg [2:0] D_tnew,
    output reg [31:0] D_instr,
    output w_grf_we,
    output [4:0] w_grf_addr,
    output [31:0] w_grf_wdata,
    output [31:0] w_inst_addr,


    output reg [3:0] E_excCode,
    output reg E_bd,
    output D_eret,
    output npc_Br

    );
    wire `insbus;
    assign {`insbus} = onehot_wire;
    wire [4:0] rs_wire,rt_wire,rd_wire,shamt_wire;
    wire [`Bitwidth] onehot_wire;
    wire [15:0] imm16_wire;
    wire [25:0] imm26_wire;
    wire [4:0]D_A3_wire;//注意此处D_A3与D_A3_wire不同，前者是已经存在第二级流水线中的上一条指令的A3,后者是在decoder中获得的A3，即将在下一个有效沿存入第二级流水寄存器
    wire RFWR_wire;
    assign D_eret = eret;
    reg E_mtc0;
    reg [4:0] E_rd_addr;


    DecodeUnit decoder(.instr(I_instr),
                        .rs(rs_wire),
                        .rt(rt_wire),
                        .rd(rd_wire),
                        .shamt(shamt_wire),
                        .imm16(imm16_wire),
                        .imm26(imm26_wire),
                        .onehot(onehot_wire),
                        .D_A3(D_A3_wire),
                        .RFWR(RFWR_wire));

    wire [31:0] RD1_wire,RD2_wire;
    GRF grf(.clk(clk),
            .reset(reset),
            .A1(rs_wire),
            .A2(rt_wire),
            .RFWR(RFWR_W),
            .A3(A3_W),
            .WD(WD_W),
            .pc(pc_W),
            .RD1(RD1_wire),
            .RD2(RD2_wire),
            .w_grf_we(w_grf_we),
            .w_grf_addr(w_grf_addr),
            .w_grf_wdata(w_grf_wdata),
            .w_inst_addr(w_inst_addr));
    wire [31:0] MF_NPC_rs,MF_NPC_rt;
    assign MF_NPC_rs = (rs_wire == E_A3 && E_RFWR && !E_tnew && rs_wire != 5'b0) ? E_WD : RD1_wire;
    assign MF_NPC_rt = (rt_wire == E_A3 && E_RFWR && !E_tnew && rt_wire != 5'b0) ? E_WD : RD2_wire;
    NPC npc(.pc(I_pc_pass),
            .imm16(imm16_wire),
            .imm26(imm26_wire),
            .onehot(onehot_wire),
            .RD1_rs(MF_NPC_rs),
            .RD2_rt(MF_NPC_rt),
            .npc(npc_pass),
            .EPC(EPC),
            .req(req),
            .D_eret(D_eret),
            .Br(npc_Br));
    
    wire [2:0] tnew_wire;
	wire D_MDFamily_wire = (mult|multu|div|divu);
    reg  D_MDFamily;
    StallandT stallCTRL(.instr(I_instr),
                        .onehot(onehot_wire),
                        .D_tnew(D_tnew),
                        .E_tnew(E_tnew),
                        .D_A3(D_A3),
                        .E_A3(E_A3),
                        .D_RFWR(D_RFWR),//D_RFWR与RFWR_wire 的区别同�
                        .E_RFWR(E_RFWR),
                        .rs(rs_wire),
                        .rt(rt_wire),
                        .stall(D_stall),
                        .tnew(tnew_wire),
								.XALU_Busy(E_Busy),
								.D_MDFamily(D_MDFamily),

                                .D_eret(D_eret),
                                .E_mtc0(E_mtc0),
                                .M_mtc0(M_mtc0),
                                .E_rd_addr(E_rd_addr),
                                .M_rd_addr(M_rd_addr));//tnew_wire �D_tnew 的区别与D_A3 和D_A3_wire的区别相�
    initial begin
        D_onehot <= 0;
        D_RD1 <= 32'd0;
        D_RD2 <= 32'd0;
        D_A1 <= 5'd0;
        D_A2 <= 5'd0;
        D_A3 <= 5'd0;
        D_RFWR <= 0;
        //D_WD = 32'd0;
        D_tnew <= 3'd0;
        D_instr <= 32'd0;
        D_pc <= 32'd0;
        D_MDFamily <= 0;
        E_excCode <= 0;
        E_bd <= 0;
        E_mtc0 <= 0;
        E_rd_addr <= 0;
    end


    wire excRI = ~(   beq | bne | bgez | bgtz | blez | bltz |
                    j | jal | jalr | jr |
                    lb | lbu | lh | lhu | lw | sb | sh | sw |
                    lui | addi | addiu | Andi | ori | Xori | slti | sltiu |
                    add | addu | sub | subu | And | Nor | Or | Xor | slt | sltu |
                    sll | sllv | sra | srav | srl | srlv |
                    nop |
                    div | divu | mfhi | mflo | mthi | mtlo | mult | multu |
                    mtc0 | mfc0 | eret);



    always @(posedge clk) begin
        if(reset | D_stall |req) begin
            D_onehot <= 32'd0;
            D_RD1 <= 32'd0;
            D_RD2 <= 32'd0;
            D_A1 <= 5'd0;
            D_A2 <= 5'd0;
            D_A3 <= 5'd0;
            D_RFWR <= 0;
            //D_WD <= 32'd0;
            D_tnew <= 3'd0;
            D_instr <= 32'd0;
            D_pc <= (D_stall) ? I_pc : (req ? 32'h0000_4180 : 0);
            D_MDFamily <= 0;

            E_rd_addr <= 0;
            E_mtc0 <= 0;
            E_excCode <= 0;
            E_bd <= (D_stall) ? D_bdin : 0;
            E_rd_addr <= 0;
            E_mtc0 <= 0;
        end else begin
            D_onehot <= onehot_wire;
            D_RD1 <= RD1_wire;
            D_RD2 <= RD2_wire;
            D_A1 <= rs_wire;
            D_A2 <= rt_wire;
            D_A3 <= D_A3_wire;
            D_RFWR <= RFWR_wire;
            //D_WD <= 
            D_instr <= I_instr;
            D_pc <= I_pc;
            D_tnew <= (!tnew_wire) ? 3'b000 : (tnew_wire - 3'b001);
            D_MDFamily <= D_MDFamily_wire;
            E_excCode <= (D_excCode) ? D_excCode : 
                        (excRI) ? 10 :
                        0;
            E_bd <= D_bdin;
            E_rd_addr <= rd_wire;
            E_mtc0 <= mtc0;
        end
    end
endmodule
