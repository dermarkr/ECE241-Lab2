module v7404(input pin1, pin3, pin5, pin9, pin11, pin13, output pin2, pin4, pin6, pin8, pin10, pin12);

	assign pin2 = ~pin1;
	assign pin4 = ~pin3;
	assign pin6 = ~pin5;
	assign pin8 = ~pin9;
	assign pin10 = ~pin11;
	assign pin12 = ~pin13;
	
endmodule

module v7408(input pin1, pin2, pin4, pin5, pin8, pin9, pin11, pin12, output pin3, pin6, pin10, pin13);

	assign pin3 = (pin1 & pin2);
	assign pin6 = (pin4 & pin5);
	assign pin10 = (pin8 & pin9);
	assign pin13 = (pin11 & pin12);
	
endmodule

module v7432(input pin1, pin2, pin4, pin5, pin8, pin9, pin11, pin12, output pin3, pin6, pin10, pin13);

	assign pin3 = (pin1 | pin2);
	assign pin6 = (pin4 | pin5);
	assign pin10 = (pin8 | pin9);
	assign pin13 = (pin11 | pin12);
	
endmodule

module Main(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;
	 
	 wire Connection1, Connection2, Connection3;

    	 v7404 u0(.pin1(SW[0]),.pin2(Connection1));
	 v7408 u1(.pin1(SW[1]),.pin2(Connection1), .pin3(Connection2), .pin4(SW[0]), .pin5(SW[2]), .pin6(Connection3));
	 v7432 u2(.pin1(Connection2), .pin2(Connection3), .pin3(LEDR[0]));
	 
endmodule
