`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/03 13:08:25
// Design Name: 
// Module Name: id
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


module ID(
//	input clk,
	input [`InstBus] inst,

	// wb
	input we,
	input [`RegAddrBus] waddr,
	input [`RegBus] wdata,

	// output
	output [`RegBus] rdata1,
	output [`RegBus] rdata2,
	output [`RegBus] extend,
	output [`RegAddrBus] rt,
	output [`RegAddrBus] rd,

	// control signal
	output RegDst,
	output Branch,
	output MemRead,
	output MemtoReg,
	output [1:0] ALUOp,
	output MemWrite,
	output ALUSrc,
	output RegWrite,

	// pc
	input [`InstAddrBus] if_pc,
	output [`InstAddrBus] id_pc
	);
	
	assign rt = inst[`RtAddr];
	assign rd = inst[`RdAddr];
	assign extend = inst[15] ? {16'hffff, inst[`ConsAddr]} : {16'h0000, inst[`ConsAddr]};
	assign id_pc = if_pc;

	regfile rf(.RegWrite(we),
			   .waddr(waddr),
			   .wdata(wdata),
			   .raddr1(inst[25:21]),
			   .rdata1(rdata1),
			   .raddr2(inst[20:16]),
			   .rdata2(rdata2)
			   );

	control ctrl(.op(inst[`OpAddr]),
				 .RegDst(RegDst),
				 .Branch(Branch),
				 .MemRead(MemRead),
				 .MemtoReg(MemtoReg),
				 .ALUOp(ALUOp),
				 .MemWrite(MemWrite),
				 .ALUSrc(ALUSrc),
				 .RegWrite(RegWrite)
				 );

endmodule
