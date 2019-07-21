`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/12 14:22:21
// Design Name: 
// Module Name: mem
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


module MEM(
	// signal
	input Branch,
	input MemRead,
	input MemtoReg,
	input MemWrite,
	input RegWrite,
	input ALUZero,
	output mem_RegWrite,
	output mem_MemtoReg,
	output mem_PCSrc,

	// data
	input [`InstAddrBus] pc,
	input [`RegBus] ALUResult,
	input [`RegBus] rdata2,
	input [`RegAddrBus] regdst,
	output [`InstAddrBus] mem_pc,
	output [`RegBus] memdata,
	output [`RegBus] mem_ALUResult,
	output [`RegAddrBus] mem_regdst,

	// data memory
	input [`RegBus] rdata,
	output mem_MemWrite,
	output mem_MemRead,
	output [`RegBus] dataAddr,
	output [`RegBus] wdata
	);
	
	assign mem_RegWrite = RegWrite;
	assign mem_MemtoReg = MemtoReg;
	assign mem_PCSrc = Branch & ALUZero;

	assign mem_pc = pc;
	assign memdata = rdata;
	assign mem_ALUResult = ALUResult;
	assign mem_regdst = regdst;

	assign mem_MemWrite = MemWrite;
	assign mem_MemRead = MemRead;
	assign dataAddr = ALUResult;
	assign wdata = rdata2;

endmodule
