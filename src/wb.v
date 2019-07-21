`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/12 16:28:22
// Design Name: 
// Module Name: wb
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


module WB(
	// signal
	input RegWrite,
	input MemtoReg,
	output wb_RegWrite,

	// data
	input [`RegBus] memdata,
	input [`RegBus] ALUResult,
	input [`RegAddrBus] regdst,
	output [`RegBus] wdata,
	output [`RegAddrBus] wb_regdst
	);

	assign wb_RegWrite = RegWrite;
	assign wb_regdst = regdst;

	mux_32 mux32(.in0(ALUResult),
				 .in1(memdata),
				 .ctrl_sig(MemtoReg),
				 .out(wdata)
				 );

endmodule
