`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2025 17:17:01
// Design Name: 
// Module Name: Home_Alarm_System
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The Home_Alarm_System module handles the logic for checking if windows or doors are open
// Dependencies: None
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Home_Alarm_System(
    input [3:0] opening,   // 4 bits for windows and doors
    input alarmswitch,      // Power switch for alarm
    output reg out         // Alarm output signal
);
    always @(opening or alarmswitch) begin
        // If alarm switch is ON and 3 or more windows/doors are open, activate alarm
        if (alarmswitch && (opening[3] + opening[2] + opening[1] + opening[0] >= 3)) begin
            out = 1; // Trigger alarm
        end else begin
            out = 0; // No alarm
        end
    end
endmodule


