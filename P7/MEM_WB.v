`timescale 1ns / 1ps
`include "onehot.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:52:38 12/11/2021 
// Design Name: 
// Module Name:    MEM_WB 
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
module MEM_WB(
    input clk,
    input reset,
    input [31:0] E_instr,
    input [31:0] E_pc,
    input [`Bitwidth] E_onehot,
    input [31:0] E_RD2,
    input [31:0] E_data,
    input [4:0] E_A3,
    input [3:0] E_byteen,
    input [4:0] E_loadType,
    input E_about_DM,
    input E_RFWR,
    input E_DMWR,

    input [31:0] E_MFALUB,
    input [5:0] HWint,
    input M_Ov_DM,
    input M_bdin,
    input [3:0] M_excCode,

    input [31:0] m_data_rdata,
    output reg RFWR_W,
    output reg [4:0] A3_W,
    output [31:0] WD_W,
    output reg [31:0] pc_W,
    output [31:0] m_data_addr,
    output [31:0] m_data_wdata,
    output [3:0] m_data_byteen,
    output [31:0] m_inst_addr,

    output [31:0] EPCout,
    output req,
    output tbReq

    );
    assign m_data_addr = E_data ;
    assign m_data_wdata = MF_DM;
    assign m_data_byteen = (E_byteen & {4{~req}} ) ;
    assign m_inst_addr = E_pc;       

    wire `insbus;
    //wire [31:0] dmout_wire;
    assign {`insbus} = E_onehot;


    wire AliError = ((lw|sw) && (|E_data[1:0])) || 
                    ((lh | lhu | sh) && (E_data[0]));
    wire TiError = (lb|lbu|sb|sh|lh|lhu)&&(E_data >= 32'h7f00) ;
    wire saveTimerError = (E_data >= 32'h7f08 && E_data <= 32'h7f0b) ||
                            (E_data >= 32'h7f18 && E_data <= 32'h7f1b);
    wire OutofRange = ~((E_data >= 0 && E_data <= 32'h2fff) ||
                        (E_data >= 32'h7f00 && E_data <= 32'h7f0b)||
                        (E_data >= 32'h7f10 && E_data <= 32'h7f1b));

    wire excAdel,excAdes;
    assign excAdel =  (lw | lb | lbu | lh | lhu) && (AliError | TiError | OutofRange | M_Ov_DM );
    assign excAdes =  (sw | sh | sb) && (AliError | TiError | OutofRange | M_Ov_DM | saveTimerError);
    
    wire [3:0] excCodetoCP0;
    assign excCodetoCP0 = (M_excCode) ? (M_excCode) : 
                    (excAdel) ? 4 :
                    (excAdes) ? 5 :
                    0;
    
    wire [31:0] MF_CP0Din;
    assign MF_CP0Din = (RFWR_W && A3_W != 5'b0 && A3_W == E_instr[20:16]) ? WD_W : E_MFALUB;
    
    wire [31:0] Dout;

    CP0 cp0(.clk(clk),
            .reset(reset),
            .A1(E_instr[15:11]),
            .A2(E_instr[15:11]),
            .Din(MF_CP0Din),
            .bdin(M_bdin),
            .pc(E_pc),
            .HWint(HWint),
            .we(mtc0),
            .ExcCodeIn(excCodetoCP0),
            .ExlClr(eret),
            .EPCout(EPCout),
            .Dout(Dout),
            .Req(req),
            .tbReq(tbReq));


    //wire loadToreg = (lw | lb | lh);
    reg [1:0] M_offset;
    reg [4:0] M_loadType;
    reg [31:0] M_RawData;
	reg		M_about_DM;

    initial begin
        RFWR_W = 0;
        A3_W = 5'b0;
        //WD_W = 32'b0;
        pc_W = 32'b0;
        M_offset = 2'b00;
        M_loadType = 0;
        M_RawData = 0;
        M_about_DM = 0;
    end

    wire [31:0] MF_DM;
    wire [1:0] offset = E_data[1:0];
    wire [31:0] res = E_about_DM ? m_data_rdata : 
                        ( (mfc0) ? Dout : 
                        E_data);
    assign MF_DM = (RFWR_W && A3_W != 5'b0 && A3_W == E_instr[20:16]) ? (WD_W<<({E_data[1:0],3'b0})) : E_RD2;
    /*DM dm(.clk(clk),
        .reset(reset),
        .onehot(E_onehot),
        .addr(E_data),
        .pc(E_pc),
        .wd(MF_DM),
        .DMWR(E_DMWR),
        .RD(dmout_wire));*/
    
    always @(posedge clk) begin
        if(reset || req) begin
            RFWR_W <= 0;
            A3_W <= 5'b0;
            //WD_W <= 32'b0;
            pc_W <= (req) ? 32'h4180 : 32'b0;
            M_offset <= 2'b00;
            M_loadType <= 0;
            M_RawData <= 0;
            M_about_DM <= 0;
        end
        else begin
            pc_W <= E_pc;
            A3_W <= E_A3;
            RFWR_W <= E_RFWR;
            M_offset <= offset;
            M_loadType <= E_loadType;
            M_RawData <= res;
            M_about_DM <= E_about_DM;
           // WD_W <= (loadToreg) ? dmout_wire : E_data;

        end
    end

//  ##############################        W �                 //####################
    wire [31:0] Ext_wire;
    MemExtUnit mem_ext(.RawMemData(M_RawData),
                .offset(M_offset),
                .loadType(M_loadType),
                .ExtMemData(Ext_wire));
    assign WD_W = M_about_DM ? Ext_wire : M_RawData;
endmodule
