`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:23 10/23/2021 
// Design Name: 
// Module Name:    BlockChecker 
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
`define S0 4'b0000 //初始状态
`define S1 4'b0001 //录入单词中
`define S2 4'b0010 //录入空格
`define S3 4'b0011 //b
`define S4 4'b0100 //be
`define S5 4'b0101 //beg
`define S6 4'b0110 //begi
`define S7 4'b0111 //begin
`define S8 4'b1000 //e
`define S9 4'b1001 //en
`define S10 4'b1010 //end
`define S11 4'b1011 //Wrong!!!

module BlockChecker(
    input clk,
    input reset,
    input [7:0] in,
    output result
    );

    reg [3:0]flag;
    reg [3:0] status;

    initial begin
        status <= `S0;
        flag <= 0;
    end

    always @(posedge reset) begin
        status <= `S0;
        flag <= 0;
    end

    always @(posedge clk ) begin
        if(reset == 1)begin
            status <= `S0;
            flag <= 0;
        end
        else begin
            case (status)
                `S0 : begin
                    case (in)
                        " ": begin
                            status <= `S2;
                        end
                        "b" : begin
                            status <= `S3;
                        end
                        "e" : begin
                            status <= `S8;
                        end
                        "B" : begin
                            status <= `S3;
                        end
                        "E" : begin
                            status <= `S8;
                        end
                        default : begin 
                            status <= `S1;
                        end
                    endcase
                end

                `S1 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        default : begin 
                            status <= `S1;
                        end
                    endcase
                end

                `S2 : begin
                    case (in)
                        " ": begin
                            status <= `S2;
                        end
                        "b" : begin
                            status <= `S3;
                        end
                        "e" : begin
                            status <= `S8;
                        end
                        "B" : begin
                            status <= `S3;
                        end
                        "E" : begin
                            status <= `S8;
                        end
                        default : begin 
                            status <= `S1;
                        end
                    endcase
                end

                `S3 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        "e" : begin
                            status <= `S4;
                        end
                        "E" : begin
                            status <= `S4;
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S4 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        "g" : begin
                            status <= `S5;
                        end
                        "G" : begin
                            status <= `S5;
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S5 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        "i" : begin
                            status <= `S6;
                        end
                        "I" : begin
                            status <= `S6;
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S6 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        "n" : begin
                            status <= `S7;
                            flag <= flag + 1;
                        end
                        "N" : begin
                            status <= `S7;
                            flag <= flag + 1;
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S7 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        default : begin 
                            status <=`S1;
                            flag <= flag - 1;
                        end
                    endcase
                end

                `S8 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        "n" : begin
                            status <= `S9;
                        end
                        "N" : begin
                            status <= `S9;
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S9 : begin
                    case (in)
                        " " : begin
                            status <= `S2;
                        end
                        "d" : begin
                            status <= `S10;
                        end
                        "D" : begin
                            status <= `S10;
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S10 : begin
                    case (in)
                        " " : begin
                            if(flag == 0) begin
                                status <= `S11;
                            end
                            else begin
                                status <= `S2;
                                flag <= flag - 1;
                            end
                        end
                        default : begin 
                            status <=`S1;
                        end
                    endcase
                end

                `S11 : begin
                    status <= `S11;
                end
            endcase
        end
    end

    assign result = ((status == `S10) && (flag == 0)) ? 0 : ((status == `S10) && (flag == 1)) ? 1 : status == `S11 ? 0 : flag == 0 ? 1 : 0;

endmodule
