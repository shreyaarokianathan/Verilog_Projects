`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 17:17:01
// Design Name: 
// Module Name: Top_Module_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Testbench for Top_Module to simulate and verify functionality
// Dependencies: Top_Module, Seven_Segment, Home_Alarm_System
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Top_Module_tb;

    reg clk;
    reg reset;
    reg [4:0] opening;
    reg [3:0] alarm;
    wire [3:0] an;
    wire [6:0] seg;

    // Instantiate the top module
    Top_Module uut (
        .clk(clk),
        .reset(reset),
        .opening(opening),
        .alarm(alarm),
        .an(an),
        .seg(seg)
    );

    // Generate clock signal
    always begin
        #5 clk = ~clk;  // Clock with period 10ns
    end

    // Test stimulus
    initial begin
        // Initialize signals
        clk = 0;
        reset = 0;
        opening = 5'b00000;
        alarm = 4'b0000;

        // Apply reset
        reset = 1;
        #10;
        reset = 0;

        // Test opening and alarm signals
        opening = 5'b00001; // Opening state 1
        alarm = 4'b0001;    // Alarm state 1
        #100;

        opening = 5'b00010; // Opening state 2
        alarm = 4'b0010;    // Alarm state 2
        #100;

        opening = 5'b00100; // Opening state 3
        alarm = 4'b0100;    // Alarm state 3
        #100;

        opening = 5'b01000; // Opening state 4
        alarm = 4'b1000;    // Alarm state 4
        #100;

        // Finish the simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %t | an: %b | seg: %b", $time, an, seg);
    end

endmodule
