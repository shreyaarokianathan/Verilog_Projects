
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 17:17:01
// Design Name: 
// Module Name: Top_Module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Top module that connects the home alarm system and 7-segment display
// Dependencies: Seven_Segment, Home_Alarm_System
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Top_Module(
    input clk,              // Clock input
    input reset,            // Reset input
    input [4:0] opening,    // Opening status input (5 bits for 5 doors)
    input [3:0] alarm,      // Alarm status (1 bit for each door)
    output [3:0] an,        // 7-segment display anode control (multiplexed)
    output [6:0] seg        // 7-segment display segment control
);
    reg [3:0] digit;        // Holds the current digit to display
    reg [3:0] an_sel;       // Holds the current anode selection
    wire [6:0] seg_out;     // 7-segment output for current digit

    // Instantiate the 7-segment display driver
    Seven_Segment display(
        .digit(digit), 
        .seg(seg_out)
    );

    // 7-segment multiplexing logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            an_sel <= 4'b0001;  // Reset the anode selection to first digit
            digit <= 4'b0000;    // Reset the digit
        end
        else begin
            case (an_sel)
                4'b0001: digit <= opening[3:0];   // First digit is for opening status
                4'b0010: digit <= alarm[3:0];     // Second digit for alarm status
                default: digit <= 4'b0000;         // Default, nothing to show
            endcase
            an_sel <= {an_sel[2:0], an_sel[3]}; // Move to next digit
        end
    end

    assign an = an_sel;
    assign seg = seg_out;
endmodule

