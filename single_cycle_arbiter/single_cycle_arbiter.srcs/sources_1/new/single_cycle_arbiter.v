`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: COLLEGE OF VLSI
// Engineer: ABHISHEK KUMAR KUSHWAHA
// 
// Create Date: 01.04.2024 14:24:44
// Design Name: 
// Module Name: single_cycle_arbiter
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


module single_cycle_arbiter #(
parameter N = 32
)(
input [N-1:0] req_i,
output [N-1:0] gnt_o
    );
    
wire [N-1:0] priority_q;
wire [N-1:0] inv;

assign priority_q[0] = 1'b0;

genvar i;
for( i = 0; i<N-1; i = i + 1)
begin
    assign priority_q [i+1] = priority_q[i] | req_i[i];
end

assign inv = ~ priority_q;

assign gnt_o = inv & req_i;
   
endmodule
