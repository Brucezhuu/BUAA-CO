`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:01 12/11/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [31:0] instr,
    input [`Bitwidth] onehot,
    input [31:0] pc,
    output [31:0] C
    );
    wire [4:0] shamt;
    assign shamt = instr[10:6];
    wire [15:0] imm16;
    assign imm16 = instr[15:0];
    wire [31:0] imm;
    wire `insbus;
    assign {`insbus} = onehot;
    assign imm = (ori|Andi|Xori) ? {{16{1'b0}},imm16} : 
                    (lui) ? {imm16,{16{1'b0}}} : 
                    {{16{imm[15]}},imm16};
    //####################    add/subFamily ##########################
        wire AS_Family	=	(addiu|addu|
	                    add|addi|lw|sw|lb|lbu|lh|lhu|sb|sh|
						subu|sub);
        wire use_rt = add | sub | addu | subu ;
        wire [31:0] B_AS = use_rt ? B : imm ;
        wire [32:0] signAdd_tmp = {A[31],A} + {B_AS[31],B_AS};
        wire [32:0] signSub_tmp = {A[31],A} - {B_AS[31],B_AS};
        wire [31:0] signAdd_res = signAdd_tmp[31:0];
        wire [31:0] signSub_res = signSub_tmp[31:0];
        wire [31:0] unsignAdd_res = A + B_AS;
        wire [31:0] unsignSub_res = A - B_AS;
        wire [31:0] AS_res;
        assign AS_res = (sub) ? signSub_res :
                                (subu) ? unsignSub_res :
                                (addu | addiu ) ? unsignAdd_res : signAdd_res;
    // #######################   logic _cal Family ##################$###
        wire LC_Family = (ori|Or|And|Andi|    Xor|Xori|   Nor|lui);
        wire [31:0] B_LC = (ori | Andi | Xori) ? imm : B;
        wire [31:0] LC_res = (ori | Or) ? A | B_LC :
                        (And | Andi) ? A & B_LC:
                        (Xor | Xori) ? A ^ B_LC:
                        ( lui ) ? imm : ~(A|B_LC);

    // ######################      shamtFamily ########################

        wire sllType =   sll|sllv,
				srlType	=	srl|srlv,
				sraType	=	sra|srav;
	    wire shift_Family	=	(sll|sllv|        srl|srlv          |sra|srav);
        wire	[31:0]	shift_A	=	(sll|srl|sra)	?	shamt	:	A;
        wire [31:0] shift_res;
        assign shift_res =  (sll|sllv) ?  B << shift_A[4:0] :
                            (srl|srlv) ? B >> shift_A[4:0] :
                            $signed($signed(B) >>> shift_A[4:0]);
        
// ###########################     cmpFamily ###################
        wire cmp_Family = 	slt|slti  |	sltu|sltiu;
        wire [31:0] B_cmp = (slt | sltu) ? B : imm;
        wire [31:0] cmp_res;
        assign  cmp_res = (slt | slti) ? ($signed(A)<$signed(B_cmp)) :
                                        (($unsigned(A)<$unsigned(B_cmp)));
        
// ############################ jFamily #################
    	wire	j_Family 	=	jal|jalr;
	    wire	[31:0]	j_Ans	=	pc+8;
// ########################### output #################
    assign C = (AS_Family) ? AS_res : 
                (LC_Family) ? LC_res : 
                (shift_Family) ? shift_res :
                (cmp_Family) ? cmp_res :
                (j_Family) ? j_Ans : 32'h0;

endmodule
