// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder4bit();
    wire[3:0] sum;  // 2's complement sum of a and b
    wire carryout;  // Carry out of the summation of a and b
    wire overflow;  // True if the calculation resulted in an overflow
    reg[3:0] a;     // First operand in 2's complement format
    reg[3:0] b;     // Second operand in 2's complement format

    FullAdder4bit adder (sum, carryout, overflow, a, b);

    initial begin
        $dumpfile("fulladder.vcd");
        $dumpvars(0, testFullAdder4bit);

	    $display(" a  | b  |carryout|sum |Overflow Flag");            // Prints header for truth table
	    a[3]=0;a[2]=0;a[1]=1;a[0]=1;b[3]=0;b[2]=0;b[1]=1;b[0]=1; #1000   // Two positive numbers, no overflow, no carryout
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=0;a[2]=1;a[1]=1;a[0]=0;b[3]=0;b[2]=1;b[1]=1;b[0]=1; #1000   // Two positive numbers with overflow, no carryout
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=0;a[2]=0;a[1]=1;a[0]=1;b[3]=1;b[2]=0;b[1]=1;b[0]=1; #1000   // One positive and one negative, no overflow, no carryout, positive > negative in magnitude
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=0;a[2]=1;a[1]=0;a[0]=1;b[3]=1;b[2]=0;b[1]=0;b[0]=1; #1000   // One positive and one negative, no overflow, no carryout, negative > positive in magnitude
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=0;a[2]=1;a[1]=1;a[0]=1;b[3]=1;b[2]=0;b[1]=1;b[0]=1; #1000   // One positive and one negative, no overflow, carryout, positive > negative in magnitude
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=0;a[2]=0;a[1]=0;a[0]=1;b[3]=1;b[2]=1;b[1]=1;b[0]=1; #1000  // One positive and one negative number of equal magnitude
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=1;a[2]=1;a[1]=0;a[0]=0;b[3]=1;b[2]=1;b[1]=1;b[0]=1; #1000  // Two negative numbers, no overflow, carryout
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
	    a[3]=1;a[2]=0;a[1]=0;a[0]=0;b[3]=1;b[2]=0;b[1]=0;b[0]=1; #1000  // Two negative numbers with overflow, carryout
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=0;a[1]=0;a[0]=0;b[3]=0;b[2]=0;b[1]=0;b[0]=1; #1000  // One zero and one positive number, no carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=0;a[1]=0;a[0]=0;b[3]=1;b[2]=0;b[1]=0;b[0]=1; #1000  // One zero and one negative number, no carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=0;a[1]=0;a[0]=0;b[3]=0;b[2]=0;b[1]=0;b[0]=0; #1000  // Two zeros, no carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=1;a[1]=1;a[0]=1;b[3]=1;b[2]=0;b[1]=0;b[0]=0; #1000  // Max positive and negative numbers, no carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=0;a[1]=0;a[0]=1;b[3]=1;b[2]=1;b[1]=1;b[0]=1; #1000  // Positive and negative one, carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=0;a[1]=1;a[0]=0;b[3]=1;b[2]=1;b[1]=0;b[0]=1; #1000  // One positive and one negative, no carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);
		a[3]=0;a[2]=1;a[1]=0;a[0]=1;b[3]=1;b[2]=0;b[1]=1;b[0]=1; #1000  // One positive and one negative, carryout, no overflow
	    $display("%b|%b|   %b    |%b|   %b", a[3:0],b[3:0],carryout,sum,overflow);

    end
endmodule
