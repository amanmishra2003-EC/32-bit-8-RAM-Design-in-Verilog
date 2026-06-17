`timescale 1ns / 1ps


module ram_tb;

reg clk ;
reg wr ;
reg [2:0] addr ;
reg [31:0] din ;
wire [31:0] dout ;

ram dut(
        .clk(clk) ,
        .wr(wr) ,
        .addr(addr) ,
        .din(din) ,
        .dout(dout) 
        ) ;

always #5 clk = ~clk ;
     
initial begin 

$dumpfile("ram.vcd") ;
$dumpvars(0,ram_tb) ;

clk = 0 ; 
wr = 0 ;
addr = 0 ;
din = 0 ;

$monitor("Time=%0t Address=%0d Data_out=%h Data_in=%h ", $time ,addr, dout, din);

#10 wr = 1 ; 
addr = 3'd0 ;
din = 32'h1234_5678 ;

#10 
addr = 3'd1 ;
din = 32'hAABB_CCDD ;

#10 
addr = 3'd2 ; 
din = 32'h1245_7869 ;

#10 
addr = 3'd3 ;
din = 32'h3412_7856 ;

#10 
addr = 3'd4 ;
din = 32'h3416_8856 ;

#10 
addr = 3'd5 ;
din = 32'hABCD_BEEF ;

#10 
addr = 3'd6 ;
din = 32'h0234_BCDE ;

#10 
addr = 3'd7 ;
din = 32'hAAAA_BBBB ;

#10 wr = 0 ; 
addr = 3'd0 ;

#10 
addr = 3'd1 ;

#10 
addr = 3'd2 ;

#10 
addr = 3'd3 ;

#10 
addr = 3'd4 ;

#10 
addr = 3'd5 ;

#10 
addr = 3'd6 ;

#10 
addr = 3'd7 ;

#10 $finish ; 

end        
endmodule
