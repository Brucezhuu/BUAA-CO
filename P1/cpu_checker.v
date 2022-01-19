 module cpu_checker(
           input clk,
           input reset,
           input [7:0] char,
           output [1:0] format_type
       );
localparam s0 = 4'b0000;
localparam s1 = 4'b0001;
localparam s2 = 4'b0010;
localparam s3 = 4'b0011;
localparam s4 = 4'b0100;
localparam s5 = 4'b0101;
localparam s6 = 4'b0110;
localparam s7 = 4'b0111;
localparam s8 = 4'b1000;
localparam s9 = 4'b1001;
localparam s10 = 4'b1010;
localparam s11 = 4'b1011;
localparam s12 = 4'b1100;
localparam s13 = 4'b1101;
localparam s14 = 4'b1110;

reg [3:0] status;
reg [3:0] cnt1,cnt2,cnt3,cnt4,cnt5;
reg flag;
initial begin
    status = s0;
    cnt1 = 4'b0000;
    cnt2 = 4'b0000;
    cnt3 = 4'b0000;
    cnt4 = 4'b0000;
    cnt5 = 4'b0000;
    flag = 0;
end

always @(posedge clk) begin
    if(reset) begin
        status <= s0;
        cnt1 <= 4'b0000;
        cnt2 <= 4'b0000;
        cnt3 <= 4'b0000;
        cnt4 <= 4'b0000;
        cnt5 <= 4'b0000;
        flag <= 0;
    end
    else begin
           case(status)
				  s0 : begin
						if(char == "^")
							 status <= s1;
						else
							 status <= s0;
				  end
				  s1 : begin
						if(char >= "0" && char <= "9") begin
							 status <= s2;
							 cnt1 <= 1;
						end
						else if (char == "^") status <= s1;
						else
							 status <= s0;
				  end
				  s2 : begin
						if(char >= "0" && char <= "9" && cnt1 <4) begin
							 cnt1 <= cnt1 + 1;
							 status <= s2;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else if(char >= "0" && char <= "9" && cnt1 >= 4) begin
							 status <= s0;
							 cnt1 <= 0;
						end
						else if(char == "@" && cnt1 <= 4) begin
							 status <= s3;
							 cnt1 <= 0;
						end
						else begin
							 cnt1 <= 0;
							 status <= s0;
						end
				  end
				  s3 : begin
						if(char >= "0" && char <= "9") begin
							 status <= s4;
							 cnt2 <= 1;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else begin
							 status <= s0;
							 cnt2 <= 0;
						end
				  end
				  s4 : begin
						if((cnt2 <4'd8 &&char >= "0" && char <= "9") || (cnt2 <4'd8 &&char >= "a" && char <= "f")) begin
							 cnt2 <= cnt2 + 1;
							 status <= s4;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else if((cnt2 >= 8 && char >= "0" && char <= "9") || (cnt2 >= 4'd8 &&char >= "a" && char <= "f")) begin
							 cnt2 <= 0;
							 status <= s0;
						end
						else if(cnt2 == 8 && char == ":") begin
							 status <= s5;
							 cnt2 <= 0;
						end
						else begin
							 cnt2 <= 0;
							 status <= s0;
						end
				  end
				  s5 : begin
						if(char == " ") begin
							 status <= s5;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else if(char == "$") begin
							 status <= s6;
							 flag <= 1;
						end
						else if(char == "*") begin
							 status <= s7;
							 flag <= 0;
						end
						else
							 status <= s0;
				  end
				  s6 : begin
						if(char >= "0" && char <= "9") begin
							 cnt3 <= cnt3 + 1;
							 status <= s8;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else begin
							 status <= s0;
						end
				  end
				  s8 : begin
						if(char >= "0" && char <= "9" && cnt3 < 4) begin
							 cnt3 <= cnt3 + 1;
							 status <= s8;
						end
						else if(char >= "0" && char <= "9" && cnt3>=4) begin
							 cnt3 <= 0;
							 status <= s0;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else if(char == " ") begin
							 cnt3 <= 0;
							 status <= s10;
						end
						else if(char == "<") begin
							 cnt3 <= 0;
							 status <= s9;
						end
						else begin
							 cnt3 <= 0;
							 status <= s0;
							 flag <= 0;
						end
				  end
				  s7 : begin
						if(char >= "0" && char <= "9") begin
							 cnt4 <= 1;
							 status <= s11;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else begin
							 status <= s0;
							 flag <= 0;
						end
				  end
				  s11 : begin
						if((char >= "0" && char <= "9" && cnt4 < 8) || (cnt4 <4'd8 &&char >= "a" && char <= "f")) begin
							 cnt4<= cnt4 + 1;
							 status <= s11;
						end
						else if((char >= "0" && char <= "9" && cnt4 >= 8) || (cnt4 >=4'd8 &&char >= "a" && char <= "f")) begin
							 cnt4 <= 0;
							 status <= s0;
						end
						else if(cnt4 == 8 && char == " ") begin
							 cnt4 <= 0;
							 status <= s10;
						end
						else if(cnt4 == 8 && char == "<") begin
							 cnt4 <= 0;
							 status <= s9;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end

						else begin
							 cnt4 <= 0;
							 status <= s0;
							 flag <= 0;
						end
				  end
				  s10 : begin
						if(char == " ") begin
							 status <= s10;
						end
						else if(char == "<")
							 status <= s9;
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end

						else begin
							 status <= s0;
							 flag <= 0;
						end
				  end
				  s9 : begin
						if(char == "=")
							 status <= s12;
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else begin
							 status <= s0;
							 flag <= 0;
						end
				  end
				  s12 : begin
						if(char == " ")
							 status <= s12;
						else if((char >= "0" && char <= "9") || (char >= "a" &&char <= "f")) begin
							 cnt5 <= 1;
							 status <= s13;
						end
						else if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
							 flag <= 0;
						end
						else begin
							 status <= s0;
							 flag <= 0;
						end
				  end
				  s13: begin
						if((char >= "0" && char <= "9" && cnt5 <4'd8) || (cnt5 <4'd8 &&char >= "a" && char <= "f")) begin
							 cnt5 <= cnt5 + 1;
							 status <= s13;
						end
						else if((char >= "0" && char <= "9" && cnt5 >= 8) || (char >= "a" && char <= "f" && cnt5 >= 8)) begin
							 cnt5 <= 0;
							 status <= s0;
						end
						else if(cnt5 == 8 && char == "#") begin
							 status <= s14;
							 cnt5 <= 0;
						end
						else if(char == "^") begin
						status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
						end
						else begin
							 cnt5 <= 0;
							 status <= s0;
						end
				  end
				  s14 : begin
						if(char == "^") begin
							 status <= s1;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;

						end
						else begin
							 status <= s0;
							 cnt1 <= 4'b0000;
							 cnt2 <= 4'b0000;
							 cnt3 <= 4'b0000;
							 cnt4 <= 4'b0000;
							 cnt5 <= 4'b0000;
						end
				  end
				  default begin
						status <= s0;
						cnt1 <= 4'b0000;
						cnt2 <= 4'b0000;
						cnt3 <= 4'b0000;
						cnt4 <= 4'b0000;
						cnt5 <= 4'b0000;
				  end
    endcase
    end
end

assign format_type = (status == 4'd14) ?(
								(flag == 1) ? 2'b01 : 2'b10) : 2'b00;
endmodule
