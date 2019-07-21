`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/12 14:22:21
// Design Name: 
// Module Name: pc
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


module pc_reg(
	input clk,
	input rst,

	input [`InstAddrBus] new_pc,
	output [`InstAddrBus] pc
	);

	// always @(posedge clk or posedge rst) begin
	// 	if (rst == `RstEnable)
	// 		ce <=   `ChipDisable;
	// 	else
	// 		ce <=   `ChipEnable;
	// end

	always @(posedge clk or posedge rst) begin
		if (rst == `ChipDisable)
			pc <= `ZeroWord;
		else
			pc <=  new_pc;
	end

endmodule
