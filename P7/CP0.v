`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:42:40 12/23/2021 
// Design Name: 
// Module Name:    CP0 
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
`define IM SR[15:10]  //     hardware interupt enable
`define IE SR[0]     //      global interupt enable 
`define EXL SR[1]     //     exception level :  1 : in exceptino &&  not allow interrupt
`define hwint_pend Cause[15:10] 
`define ExcCode Cause[6:2]
`define BD Cause[31]

module CP0(
    input clk,
    input reset,
    input [4:0] A1,      // mfc0
    input [4:0] A2,      // mtc0
    input [31:0] Din,    // mtc0_data
    input bdin,          //  branch_delay instr is interupt
    input [31:0] pc,     // pc of interupted instr
    input [5:0] HWint,   // hardware interupt req
    input we,            // mtc0 write enable
    input [3:0] ExcCodeIn, // exception code
    input ExlClr,        // when : eret set exl 0 
    output [31:0] EPCout,// eret return PC
    output [31:0] Dout,  // mfc0 dataout 
    output Req  ,         // interrupt sign for CPU
    output reg tbReq
    );
    
    reg [31:0] SR;
    reg [31:0] Cause;
    reg [31:0] EPC;
    reg [31:0] PrID;

    initial begin
        SR <= 0;
        Cause <= 0;
        EPC <= 0;
        PrID <= 32'h2002_0529;
        tbReq <= 0;
    end

    wire excReq;
    assign intReq =  ( (|(`IM & HWint)) && `IE && ~`EXL );
    assign excReq =  ( |(ExcCodeIn) && !`EXL);
    assign Req = intReq | excReq;
    wire tmp_tbReq = (HWint[2] & SR[12] & (~`EXL) & `IE);
    
    always @(posedge clk) begin
        tbReq <= tmp_tbReq;
    end

    assign Dout = (A1 == 12) ? SR : 
                    (A1 == 13) ? Cause :
                    (A1 == 14) ? EPC :
                    (A1 == 15) ? PrID : 0;

    assign EPCout = EPC;

    always @(posedge clk) begin
        if(reset) begin
            SR <= 0;
            Cause <= 0;
            EPC <= 0;
            PrID <= 32'h2002_0529;
            tbReq <= 0;
        end 
        else begin
            `hwint_pend <= HWint;
            if(ExlClr) `EXL <= 0;

            else if(Req) begin///////// ############################
                if(intReq) begin
                    `ExcCode <= 0;
                    `BD <= bdin;
                    `EXL <= 1;
                    EPC <= (bdin) ? (pc - 4) : pc;
                end
                else begin
                    `ExcCode <= ExcCodeIn;
                    `BD <= bdin;
                    `EXL <= 1;
                    EPC <= (bdin) ? (pc - 4) : pc;
                end
            end
            else if(we) begin
                if(A2 == 12) begin
					 SR[15:10] <= Din[15:10];
					 SR[1] <= Din[1];
					 SR[0] <= Din[0];
					 end
                else if(A2 == 14) EPC <= Din;
            end
        end
    end
endmodule
