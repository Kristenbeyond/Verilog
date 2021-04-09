`timescale 1ns / 1ps

     
module logic_lab1(
    input[1:0]swt,
    output[1:0]led
    );
     
     assign led[0] = swt[1]^swt[0];
     assign led[1] = ~(~(swt[1] & swt[0]));
endmodule
