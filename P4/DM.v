`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:59:18 12/04/2021 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input wire clk,
    input wire reset,
    input wire [31:0] addr,
    input wire[31:0] wd,
    input wire[31:0] PC,
    input wire we,
    input wire [1:0] wbh,
    output wire [31:0] Memdata,
    output wire [31:0] RD
    );

    reg [31:0] din;
    reg [31:0] ram[1023:0];
    reg [31:0] bytee;
    reg [31:0] half;
    reg [31:0] dout;
    reg [31:0] lb;
    reg [31:0] lh;
    reg  [31:0] dmout;
    integer i;
    initial begin
        for(i=0;i<1024;i=i+1) begin
            ram[i] = 32'b0;
        end
        din = 32'b0;
        bytee = 32'b0;
        half = 32'b0;
        lb = 32'b0;
        lh = 32'b0;
        dmout = 32'b0;
    end
    always @* dout = ram[addr[11:2]];
    assign RD = dmout;
    always @(posedge clk) begin
        if(reset) begin
            for(i = 0;i<1024;i=i+1) begin
                ram[i] <= 32'b0;
            end
        end else begin
            if(we) begin
                if(wbh == 2'b00) begin
                    ram[addr[11:2]] <= din;
                    $display("@%h: *%h <= %h", PC, addr, din);
                end
                else if(wbh == 2'b01) begin
                    ram[addr[11:2]] <= din;
                    $display("@%h: *%h <= %h", PC, addr, wd[7:0]);
                end
                else begin
                    ram[addr[11:2]] <= din;
                    $display("@%h: *%h <= %h", PC, addr, wd[15:0]);
                end
            end
        end
    end

    always @(*) begin
        case(addr[1:0])
            2'b00 : begin
                bytee = {dout[31:8],wd[7:0]};
            end
            2'b01 : begin
                bytee = {dout[31:16],wd[7:0],dout[7:0]};
            end
            2'b10 : begin
                bytee = {dout[31:24],wd[7:0],dout[15:0]};
            end
            2'b11 : begin
                bytee = {wd[7:0],dout[23:0]};
            end
            default : begin
                bytee = 32'b0;
            end
        endcase
    end

    always @(*) begin
        case (addr[1])
            1'b0 : begin
                half = {dout[31:16],wd[15:0]};
            end
            1'b1 : begin
                half = {wd[15:0],dout[15:0]};
            end
            default : begin
                half = 32'b0;
            end
        endcase
    end

    always @(*) begin
        case (addr[1:0])
            2'b00 : begin
                lb = {{24{dout[7]}},dout[7:0]};
            end
            2'b01 : begin
                lb = {{24{dout[15]}},dout[15:8]};
            end
            2'b10 : begin
                lb = {{24{dout[23]}},dout[23:16]};
            end
            2'b11 : begin
                lb = {{24{dout[31]}},dout[31:24]};
            end
            default : begin
                lb = 32'b0;
            end
        endcase 
    end
    always @(*) begin
        case (addr[1])
            1'b0 : begin
                lh = {{16{dout[15]}},dout[15:0]};
            end
            1'b1 : begin
                lh = {{16{dout[31]}},dout[31:16]};
            end
            default : begin
                lh = 32'b0;
            end
        endcase
    end

    always @(*) begin
        case(wbh) 
            2'b00 : begin
                din = wd;
                dmout = dout;
            end
            2'b01 : begin
                din = bytee;
                dmout = lb;
            end
            2'b10 : begin
                din = half;
                dmout = lh;
            end
            default : begin
                din = 32'b0;
                dmout = 32'b0;
            end
        endcase
    end
endmodule
