`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 13:52:27
// Design Name: 
// Module Name: Mirror_Display
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


module Mirror_Display(
    input wire [7:0] Temperature, //All 4 sensors are declared as inputs
    input wire [7:0] Average_mpg,
    input wire [7:0] Instantaneous_mpg,
    input wire [7:0] Miles_remaining,
    input wire [1:0] SS, //selector switches
    output reg [7:0] Display //output mirror display
    );
    always @(*)
    case(SS)
    0: Display = Temperature;
    1: Display = Average_mpg;
    2: Display = Instantaneous_mpg;
    3: Display = Miles_remaining;
    endcase
endmodule

