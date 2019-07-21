`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 16:03:16
// Design Name: 
// Module Name: ex_mem
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


module EX_MEM(
	input clk,
	input rst,

	// control signal
	input ex_Branch,
	input ex_MemRead,
	input ex_MemtoReg,
	input ex_MemWrite,
	input ex_RegWrite,
	output reg mem_Branch,
	output reg mem_MemRead,
	output reg mem_MemtoReg,
	output reg mem_MemWrite,
	output reg mem_RegWrite,

	// data
	input [`InstAddrBus] ex_pc,
	input ex_ALUZero,
	input [`RegBus] ex_ALUResult,
	input [`RegBus] ex_rdata2,
	input [`RegAddrBus] ex_regdst,
	output reg [`InstAddrBus] mem_pc,
	output reg mem_ALUZero,
	output reg [`RegBus] mem_ALUResult,
	output reg [`RegBus] mem_rdata2,
	output reg [`RegAddrBus] mem_regdst
	);

	always @(posedge clk or posedge rst) begin
		if (rst == `RstEnable) begin
			mem_Branch <= `ZeroWord;
			mem_MemRead <= `ZeroWord;
			mem_MemtoReg <= `ZeroWord;
			mem_MemWrite <= `ZeroWord;
			mem_RegWrite <= `ZeroWord;
			mem_pc <= `ZeroWord;
			mem_ALUZero <= `ZeroWord;
			mem_ALUResult <= `ZeroWord;
			mem_rdata2 <= `ZeroWord;
			mem_regdst <= `ZeroWord;
		end else begin
			mem_Branch <= ex_Branch;
			mem_MemRead <= ex_MemRead;
			mem_MemtoReg <= ex_MemtoReg;
			mem_MemWrite <= ex_MemWrite;
			mem_RegWrite <= ex_RegWrite;
			mem_pc <= ex_pc;
			mem_ALUZero <= ex_ALUZero;
			mem_ALUResult <= ex_ALUResult;
			mem_rdata2 <= ex_rdata2;
			mem_regdst <= ex_regdst;
		end
	end

endmodule
