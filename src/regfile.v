`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/07/03 13:12:46
// Design Name: 
// Module Name: regfile
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


module regfile(
//  input wire rst,
//  input wire clk,

	//д�˿�
	input RegWrite,
	input [`RegAddrBus] waddr,
	input [`RegBus] wdata,
	
	//���˿�1
	input [`RegAddrBus] raddr1,
	output reg [`RegBus] rdata1,

	//���˿�2
	input [`RegAddrBus] raddr2,
	output reg [`RegBus] rdata2
	);

	//�Ĵ�������
	reg [`RegBus] regs[0:`RegNum - 1];

	//д����
	always @(*) begin
//    if(rst == `RstDisable)
		if(RegWrite == `WriteEnable && waddr != `RegNumLog2'h0)
			regs[waddr] <= wdata;
	end

	//������1 
	always @(*) begin
//    if(rst == `RstEnable)
//      rdata1 <= `ZeroWord;
		if(raddr1 == `RegNumLog2'h0)
			rdata1 <= `ZeroWord;
		else if(raddr1 == waddr && RegWrite == `WriteEnable)  // WBð��
			rdata1 <= wdata;
		else
			rdata1 <= regs[raddr1];
	end

	//������2
	always @(*) begin
//    if(rst == `RstEnable)
//      rdata2 <= `ZeroWord;
		if(raddr2 == `RegNumLog2'h0)
			rdata2 <= `ZeroWord;
		else if(raddr2 == waddr && RegWrite == `WriteEnable) // WBð��
			rdata2 <= wdata;
		else
			rdata2 <= regs[raddr2];
	end

endmodule