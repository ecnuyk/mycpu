`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 13:57:25
// Design Name: 
// Module Name: ex
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


module EX(
	// control signal
	input RegDst,
	input Branch,
	input MemRead,
	input MemtoReg,
	input [1:0] ALUOp,
	input MemWrite,
	input ALUSrc,
	input RegWrite,
	output ex_Branch,
	output ex_MemRead,
	output ex_MemtoReg,
	output ex_MemWrite,
	output ex_RegWrite,

	// data
	input [`InstAddrBus] pc,
	input [`RegBus] rdata1,
	input [`RegBus] rdata2,
	input [`RegBus] extend,
	input [`RegAddrBus] rt,
	input [`RegAddrBus] rd,
	output [`InstAddrBus] ex_pc,
	output ALUZero,
	output [`RegBus] ALUResult,
	output [`RegBus] ex_rdata2,
	output [`RegAddrBus] reg_dst
	);

	wire [31:0] imm_shift;
	assign imm_shift = extend << 2;
	Add add(.in0(pc),
			.in1(imm_shift),
			.out(ex_pc)
			);

	wire [31:0] operand1;
	mux_32 mux32(.in0(rdata2),
				 .in1(extend),
				 .ctrl_sig(ALUOp),
				 .out(operand1)
				 );

	wire [3:0] ALU_ctrl_sig;
	ALUControl aluc(.funct(extend[5:0]),
					.ALUOp(ALUOp),
					.ctrl_sig(ALU_ctrl_sig)
					);
	ALU alu(.data1(rdata1),
			.data2(operand1),
			.ctrl_sig(ALU_ctrl_sig),
			.result(ALUResult),
			.zero(ALUZero)
			);

	mux_5 mux5(.in0(rt),
			   .in1(rd),
			   .ctrl_sig(RegDst),
			   .out(reg_dst)
			   );

endmodule
