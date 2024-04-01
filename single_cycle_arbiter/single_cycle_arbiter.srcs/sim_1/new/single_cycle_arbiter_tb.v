`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 01.04.2024 15:09:43
// Design Name: 
// Module Name: single_cycle_arbiter_tb
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

`timescale 1ns / 1ps

module single_cycle_arbiter_tb;

    // Parameters
    parameter N = 32;
    parameter CLK_PERIOD = 10; // Clock period in ns

    // Inputs
    reg [N-1:0] req_i;

    // Outputs
    wire [N-1:0] gnt_o;

    // Instantiate the module under test
    single_cycle_arbiter #(
        .N(N)
    ) dut (
        .req_i(req_i),
        .gnt_o(gnt_o)
    );

    // Clock generation (if needed)
     reg clk = 0;
     always #((CLK_PERIOD / 2)) clk = ~clk;

    // Initializations
    initial begin
        // Initialize inputs
        req_i = 32'b0;
        #10;
        @(posedge clk);
        req_i = 32'd2;
        @(posedge clk);
        req_i = 32'd8;
        @(posedge clk);
        req_i = 32'd24; 
        @(posedge clk);
        req_i = 32'd15;
        @(posedge clk);
        req_i = 32'd63;
        @(posedge clk);
        req_i = 32'd2; 
        @(posedge clk);
        req_i = 32'd9;
        @(posedge clk);
        req_i = 32'd55;
        @(posedge clk);
        req_i = 32'd6;        

        // Finish simulation
        @(posedge clk);
        $finish;
    end

endmodule
