`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/03 16:17:50
// Design Name: 
// Module Name: if_id
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


module IF_ID(
	input rst,
	input clk,
	input [`InstAddrBus] if_pc,
	input [`InstBus] if_inst,
	output reg [`InstAddrBus] id_pc,
	output reg [`InstBus] id_inst
	);

	always @(posedge clk) begin
		if (rst == `RstEnable) begin
			id_pc <= `ZeroWord;
			id_inst <= `ZeroWord;
		end else begin
			id_pc <= if_pc;
			id_inst <= if_inst;
		end
	end
	
endmodule
