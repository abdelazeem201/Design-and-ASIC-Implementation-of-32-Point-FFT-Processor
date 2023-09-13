 module Full_adder 
  ( input wire [15 : 0]A, B , 
    input wire Cin,
    output wire [15 : 0]sum, 
	output wire Cout
	);
	
//assign sum =  A ^ B ^ C;
//assign Cin = (A & B) | (A & C) | (B & C);


assign { sum, Cout } = A + B + C;

endmodule