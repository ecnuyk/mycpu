`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/12 16:30:12
// Design Name: 
// Module Name: mem_wb
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


module MEM_WB(
	input clk,
	input rst,

	// signal
	input mem_RegWrite,
	input mem_MemtoReg,
	output reg wb_RegWrite,
	output reg wb_MemtoReg,

	// data
	input [`RegBus] memdata,
	input [`RegBus] mem_ALUResult,
	input [`RegAddrBus] mem_regdst,
	output reg [`RegBus] wb_memdata,
	output reg [`RegBus] wb_ALUResult,
	output reg [`RegAddrBus] wb_regdst

	// data memory
	// input [`RegBus] rdata,
	// input mem_MemWrite,
	// input mem_MemRead,
	// input [`RegBus] dataAddr,
	// input [`RegBus] wdata
	);

	always @(posedge clk or posedge rst) begin
		if (rst == `RstEnable) begin
			wb_RegWrite <= `ZeroWord;
			wb_MemtoReg <= `ZeroWord;
			wb_memdata <= `ZeroWord;
			wb_ALUResult <= `ZeroWord;
			wb_regdst <= `ZeroWord;
		end else begin
			wb_RegWrite <= mem_RegWrite;
			wb_MemtoReg <= mem_MemtoReg;
			wb_memdata <= memdata;
			wb_ALUResult <= mem_ALUResult;
			wb_regdst <= mem_regdst;
		end
	end

endmodule
