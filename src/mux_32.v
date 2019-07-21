`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 14:13:36
// Design Name: 
// Module Name: mux_32
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


module mux_32(
	input [31:0] in0,
	input [31:0] in1,
	input ctrl_sig,
	output [31:0] out
	);

	assign out = ctrl_sig ? in1 : in0;

endmodule
