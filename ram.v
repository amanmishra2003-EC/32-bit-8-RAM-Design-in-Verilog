`timescale 1ns / 1ps


module ram(
input clk , wr ,              // clock , Write/read 
input [2:0] addr ,            // address
input [31:0] din ,            // input data
output reg [31:0] dout        // output data

    );
    
    reg [31:0] mem [0:7] ;   // 32-bit 8 memory location[0-7]
    
    always @(posedge clk) begin
    if(wr)                  // when wr = 1 
        mem[addr] <= din ;  // write data to memory
    end
        
    always @(*)begin
        dout = mem[addr] ;
    end
     
    
endmodule
