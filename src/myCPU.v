`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/12 23:48:21
// Design Name: 
// Module Name: myCPU
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


module myCPU(
	input clk,
	input rst,

	// instruction memory
	input [`InstBus] memInst,
	output [`InstAddrBus] instAddr,

	// data memory
	input [`RegBus] rdata,
	output mem_MemWrite,
	output mem_MemRead,
	output [`RegBus] dataAddr,
	output [`RegBus] wdata
    );

	wire [`InstAddrBus] next_pc;
	wire [`InstBus] inst;

	wire [`InstAddrBus] if_pc;
	wire [`InstBus] id_inst;

	wire [`RegBus] rdata1;
	wire [`RegBus] rdata2;
	wire [`RegBus] extend;
	wire [`RegAddrBus] rt;
	wire [`RegAddrBus] rd;

	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [1:0] ALUOp;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire [`InstAddrBus] id_pc;

	IF IF(.clk(clk),
		  .rst(rst),
		  .PCSrc(),
		  .branchAddr(),
		  .next_pc(next_pc),
		  .inst(inst),
		  .memInst(memInst),
		  .instAddr(instAddr)
		  );

	IF_ID IF_ID(.rst(rst),
				.clk(clk),
				.if_pc(next_pc),
				.if_inst(inst),
				.id_pc(if_pc),
				.id_inst(id_inst)
				);

	ID ID(.inst(id_inst),
		  .we(),
		  .waddr(),
		  .wdata(),
		  .rdata1(rdata1),
		  .rdata2(rdata2),
		  .extend(extend),
		  .rt(rt),
		  .rd(rd),
		  .RegDst(RegDst),
		  .Branch(Branch),
		  .MemRead(MemRead),
		  .MemtoReg(MemtoReg),
		  .ALUOp(ALUOp),
		  .MemWrite(MemWrite),
		  .ALUSrc(ALUSrc),
		  .RegWrite(RegWrite),
		  .if_pc(if_pc),
		  .id_pc(id_pc)
		  );

	ID_EX ID_EX();

	EX EX();

	EX_MEM EX_MEM();

	MEM MEM();

	MEM_WB MEM_WB();

	WB WB();

endmodule
