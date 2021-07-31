`timescale 1ns / 100ps
module gls();
reg clk, reset;
wire [9:0] out;

mythcore uut1 (.clk(clk), .reset(reset), .out(out));

initial begin
        $dumpfile("gls.vcd");
        $dumpvars(0,gls);
	clk = 1;
        reset = 0;
	#2 reset = 1;
	#10 reset = 0;
        #5000 $finish;
        end
	always #5 clk = ~clk;

endmodule

