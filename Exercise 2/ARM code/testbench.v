module testbench;
	reg clk;
	reg reset;
	wire [31:0] WriteData;
	wire [31:0] DataAdr;
	wire MemWrite;
	top dut(
		.clk(clk),
		.reset(reset),
		.WriteData(WriteData),
		.DataAdr(DataAdr),
		.MemWrite(MemWrite)
	);
	initial begin
		reset <= 1;
		#(22)
			;
		reset <= 0;
	end
	always begin
		clk <= 1;
		#(5)
			;
		clk <= 0;
		#(5)
			;
	end
	always @(negedge clk)
		if (MemWrite)
			if ((DataAdr === 110) & (WriteData === 254)) begin
				$display("Simulation succeeded");
				#20;
				$finish;
			end
			else if (DataAdr !== 104) begin
				$display("Simulation failed");
				#20;
				$finish;
			end
	initial begin
		$dumpfile("top.vcd");
		$dumpvars;
	end
endmodule