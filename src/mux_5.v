`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/07 14:09:15
// Design Name: 
// Module Name: mux_5
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


module mux_5(
	input [4:0] in0,
	input [4:0] in1,
	input ctrl_sig,
	output [4:0] out
	);

	assign out = ctrl_sig ? in1 : in0;
	
endmodule
