`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 14:37:09
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
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
	input [31:0] data1,
	input [31:0] data2,
	input [3:0] ctrl_sig,
	output reg [31:0] result,
	output zero
	);

	assign zero = ~(|result);

	always @(*) begin
		if(ctrl_sig == 4'b0000)
			result <= data1 & data2;
		else if(ctrl_sig == 4'b0001)
			result <= data1 | data2;
		else if(ctrl_sig == 4'b0010)
			result <= data1 + data2;
		else if(ctrl_sig == 4'b0110)
			result <= data1 - data2;
		else if(ctrl_sig == 4'b0111) begin
			if(data1 < data2)
				result <= 32'h00000001;
			else
				result <= 32'h00000000;
		end else if(ctrl_sig == 4'b1100)
			result <= ~(data1 | data2);
	end

endmodule
