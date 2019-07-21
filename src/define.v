//********************************È«¾Öºê¶¨Òå***************************
`define RstEnable		1'b1
`define RstDisable		1'b0
`define ZeroWord		32'h00000000
`define WriteEnable		1'b1
`define WriteDisable	1'b0
`define ReadEnable		1'b1
`define ReadDisable		1'b0
`define AluOpBus		7:0     //ALUop-bus width
`define AluSelBus		2:0     //ALUsel-bus width
`define InstValid		1'b0    
`define InstInvalid		1'b1
`define True_v			1'b1    //logic-true
`define False_v			1'b0
`define ChipEnable		1'b1    
`define ChipDisable		1'b0

//********************************Ö¸ÁîÏà¹Øºê****************************
`define EXE_ORI			6'b001101
`define EXE_NOP			6'b000000

//AluOp
`define EXE_OR_OP		8'b00100101
`define EXE_NOP_OP		8'b00000000

//AluSel
`define EXE_RES_LOGIC	3'b001
`define EXE_RES_NOP		3'b000

`define OpAddr			31:26
`define RsAddr			25:21
`define RtAddr			20:16
`define RdAddr			15:11
`define ShamtAddr		10:6
`define FunctAddr		5:0
`define ConsAddr		15:0

//******************************ROMÏà¹Øºê******************************
`define InstAddrBus		31:0    //ROMµØÖ·×ÜÏß¿í¶È
`define InstBus			31:0    //ROMÊý¾Ý×ÜÏß¿í¶È
`define InstMemNum		131071  //ROMÊµ¼Ê´óÐ¡128kb
`define InstMemNumLog2	17      //ROMÊµ¼ÊÊ¹ÓÃµÄµØÖ·Ïß¿í¶È

//******************************RegFileÏà¹Øºê
`define RegAddrBus		4:0     //RegFileµØÖ·×ÜÏß¿í¶È
`define RegBus			31:0    //RegFileÄ£¿éµÄÊý¾Ý×ÜÏß¿í¶È
`define RegWidth		32      //Reg-32Î»¿í
`define DoubleRegWidth	64      
`define DoubleRegBus	63:0
`define RegNum			32
`define RegNumLog2		5       //Ñ°Ö·Í¨ÓÃ¼Ä´æÆ÷Ê¹ÓÃµÄµØÖ·Î»Êý
`define NOPRegAddr		5'b00000
