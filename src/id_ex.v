`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/03 16:20:30
// Design Name: 
// Module Name: id_ex
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


module ID_EX(
	input rst,
	input clk,

	// control signal
	input id_RegDst,
	input id_Branch,
	input id_MemRead,
	input id_MemtoReg,
	input [1:0] id_ALUOp,
	input id_MemWrite,
	input id_ALUSrc,
	input id_RegWrite,
	output reg ex_RegDst,
	output reg ex_Branch,
	output reg ex_MemRead,
	output reg ex_MemtoReg,
	output reg [1:0] ex_ALUOp,
	output reg ex_MemWrite,
	output reg ex_ALUSrc,
	output reg ex_RegWrite,

	// data
	input [`InstAddrBus] id_pc,
	input [`RegBus] id_rdata1,
	input [`RegBus] id_rdata2,
	input [`RegBus] id_extend,
	input [`RegAddrBus] id_rt,
	input [`RegAddrBus] id_rd,
	output reg [`InstAddrBus] ex_pc,
	output reg [`RegBus] ex_rdata1,
	output reg [`RegBus] ex_rdata2,
	output reg [`RegBus] ex_extend,
	output reg [`RegAddrBus] ex_rt,
	output reg [`RegAddrBus] ex_rd
	);
	
	always @(posedge clk or posedge rst) begin
		if (rst == `RstEnable) begin
			ex_RegDst <= `ZeroWord;
			ex_Branch <= `ZeroWord;
			ex_MemRead <= `ZeroWord;
			ex_MemtoReg <= `ZeroWord;
			ex_ALUOp <= `ZeroWord;
			ex_MemWrite <= `ZeroWord;
			ex_ALUSrc <= `ZeroWord;
			ex_RegWrite <= `ZeroWord;
			ex_pc <= `ZeroWord;
			ex_rdata1 <= `ZeroWord;
			ex_rdata2 <= `ZeroWord;
			ex_extend <= `ZeroWord;
			ex_rt <= `ZeroWord;
			ex_rd <= `ZeroWord;
		end else begin
			ex_RegDst <= id_RegDst;
			ex_Branch <= id_Branch;
			ex_MemRead <= id_MemRead;
			ex_MemtoReg <= id_MemtoReg;
			ex_ALUOp <= id_ALUOp;
			ex_MemWrite <= id_MemWrite;
			ex_ALUSrc <= id_ALUSrc;
			ex_RegWrite <= id_RegWrite;
			ex_pc <= id_pc;
			ex_rdata1 <= id_rdata1;
			ex_rdata2 <= id_rdata2;
			ex_extend <= id_extend;
			ex_rt <= id_rt;
			ex_rd <= id_rd;
		end
	end
	
endmodule
