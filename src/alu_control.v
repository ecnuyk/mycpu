`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 14:17:22
// Design Name: 
// Module Name: alu_control
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


module ALUControl(
	input [5:0] funct,
	input [1:0] ALUOp,
	output [3:0] ctrl_sig
	);

	always @(*) begin
		if(ALUOp == 2'b00)
			ctrl_sig <= 4'b0010;
		else if(ALUOp == 2'b01)
			ctrl_sig <= 4'b0110;
		else if(ALUOp == 2'b10) begin
			if(funct == 6'b100000)
				ctrl_sig <= 4'b0010;
			else if(funct == 6'b100010)
				ctrl_sig <= 4'b0110;
			else if(funct == 6'b100100)
				ctrl_sig <= 4'b0000;
			else if(funct == 6'b100101)
				ctrl_sig <= 4'b0001;
			else if(funct == 6'b101010)
				ctrl_sig <= 4'b0111;
			else
				ctrl_sig <= 4'b1111;
		end else
			ctrl_sig <= 4'b1111;
	end

endmodule
