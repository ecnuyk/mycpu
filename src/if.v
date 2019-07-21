`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/12 17:50:40
// Design Name: 
// Module Name: if
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


module IF(
	input clk,
	input rst,

	input PCSrc,
	input [`InstAddrBus] branchAddr,
	output [`InstAddrBus] next_pc,
	output [`InstBus] inst,

	// instruction memory
	input [`InstBus] memInst,
	output [`InstAddrBus] instAddr
    );

	wire [`InstAddrBus] new_pc;
	wire [`InstAddrBus] cur_pc;

	assign next_pc = cur_pc + 4'h4;
	assign instAddr = cur_pc;
	assign inst = memInst;

	pc_reg PC(.clk(clk),
			  .rst(rst),
			  .new_pc(new_pc),
			  .pc(cur_pc)
			  );

	mux_32 mux32(.in0(next_pc),
				 .in1(branchAddr),
				 .ctrl_sig(PCSrc),
				 .out(new_pc)
				 );

endmodule
