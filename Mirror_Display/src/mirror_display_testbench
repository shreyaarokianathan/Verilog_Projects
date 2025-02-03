`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 14:12:36
// Design Name: 
// Module Name: Mirror_Display_TB
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


module Mirror_Display_TB(
    );
    reg [7:0] Temperature;  //All 4 sensors are declared as inputs
    reg [7:0] Average_mpg;
    reg [7:0] Instantaneous_mpg;
    reg [7:0] Miles_remaining;
    reg [1:0] SS; //selector switches
    wire [7:0] Display; //output mirror display
    
   
Mirror_Display U0(Temperature,Average_mpg,Instantaneous_mpg,Miles_remaining,SS,Display);

    initial begin 
        Temperature = 8'b0;
        Average_mpg = 8'b10011000;
        Instantaneous_mpg = 8'b00010010;
        Miles_remaining =8'b1111000;
        SS = 2'b00;
        #100 //100ns delay
        
             Average_mpg = 8'b10011000;
             Instantaneous_mpg = 8'b0010010;
             Miles_remaining =8'b00001111;
             SS= 2'b11;
             #1000;
        end
endmodule
