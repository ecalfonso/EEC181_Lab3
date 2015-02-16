
module hex7seg(
	input[3:0]hex,
	output reg[0:6] seg
	);
	
	//	012_3456(segments are active-low)
	parameter ZERO = 7'b000_0001;
	parameter ONE = 7'b100_1111;
	parameter TWO = 7'b001_0010;
	parameter THREE = 7'b000_0110;
	parameter FOUR = 7'b100_1100;
	parameter FIVE = 7'b010_0100;
	parameter SIX = 7'b010_0000;
	parameter SEVEN = 7'b000_1111;
	parameter EIGHT = 7'b000_0000;
	parameter NINE = 7'b000_1100;
	parameter A = 7'b000_0010;
	parameter B = 7'b110_0000;
	parameter C = 7'b011_0001;
	parameter D = 7'b100_0010;
	parameter E = 7'b011_0000;
	//etc.
	parameter F = 7'b011_1000;
	
	always @(hex)
	
	case(hex)
	0: seg = ZERO;
	1: seg = ONE;
	2: seg = TWO;
	3: seg = THREE;
	4: seg = FOUR;
	5: seg = FIVE;
	6: seg = SIX;
	7: seg = SEVEN;
	8: seg = EIGHT;
	9: seg = NINE;
	10: seg = A;
	11: seg = B;
	12: seg = C;
	13: seg = D;
	14: seg = E;
	
	//etc.
	15: seg = F;
	endcase
	
endmodule