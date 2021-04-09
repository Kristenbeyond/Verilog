`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/09 14:08:54
// Design Name: 
// Module Name: logic_lab1_tb
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


module logic_lab1_tb(   );
    reg[1:0]switches;
    wire[1:0]leds;
    reg[7:0]e_led;
    integer i;
    //引用模块以产生实际的输出信号
    logic_lab1 dut(.led(leds),.swt(switches));
    
    /*定义函数，又完成了一遍电路功能，目的是让函数在TCL控制台（下方的窗口-tcl标签）显示某个阶段的输出情况，
    用来和电路输出进行对比分析）*/
    function[7:0]expected_Led;
        input[7:0]swt;
    begin
        expected_Led[0] = swt[1]^swt[0];
        expected_Led[1] = ~(~(swt[1]&swt[0]));
    end
    endfunction
    initial
    begin
        for(i=0;i<4;i=i+1)
        begin
            #50 switches = i;   //产生输出信号变化，每50个时间单位
            #10 e_led = expected_Led(switches);
            if(leds == e_led)   //对比函数输出与电路输出是否相同
                //在下方TCL控制台窗口显示输出
                $display("LED output matched at", $time);
            else
                //%b表示按照二进制显示
                //$time表示调用系统时间
                $display("LED output mis-matched at ",$time,":expected:%b,actual:%b",e_led, leds);
        end
    end
endmodule
