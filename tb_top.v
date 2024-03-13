`timescale 1ns / 1ps

module tb_top;

    // Inputs
    reg [6:0] d_in;
    reg clk, rst;

    // Outputs
    wire [2:0] count;

    // Instantiate the unit under test (UUT)
    top uut (
        .d_in(d_in),
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock generation
    always begin
        clk = 0;
        #5; // Half clock period
        clk = 1;
        #5; // Half clock period
    end

    // Reset generation
    initial begin
        rst = 1;
        #10; // Assert reset for 10 time units
        rst = 0;
    end

    // Stimulus
    initial begin
        // Initialize inputs
        d_in = 0;
        
        // Apply stimulus here
        @(posedge clk)
        // Example: 
         d_in = 7'b0000001; //1 Sample input
        @(posedge clk)
         d_in = 7'b0101001; //3 Sample input
        @(posedge clk)
         d_in = 7'b0111101; //5 Sample input
        @(posedge clk)
         d_in = 7'b1110101; //5 Sample input
        @(posedge clk)
         d_in = 7'b0010101; //3 Sample input
        @(posedge clk)
        d_in = 0;
        
        #50; // Wait for 50 time units
        
        // Add more stimulus if needed
        
        // Terminate simulation
        $finish;
    end

//    // Monitor
//    always @(posedge clk) begin
//        // Add monitor logic here if needed
//    end

endmodule
