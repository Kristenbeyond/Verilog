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
    //����ģ���Բ���ʵ�ʵ�����ź�
    logic_lab1 dut(.led(leds),.swt(switches));
    
    /*���庯�����������һ���·���ܣ�Ŀ�����ú�����TCL����̨���·��Ĵ���-tcl��ǩ����ʾĳ���׶ε���������
    �����͵�·������жԱȷ�����*/
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
            #50 switches = i;   //��������źű仯��ÿ50��ʱ�䵥λ
            #10 e_led = expected_Led(switches);
            if(leds == e_led)   //�ԱȺ���������·����Ƿ���ͬ
                //���·�TCL����̨������ʾ���
                $display("LED output matched at", $time);
            else
                //%b��ʾ���ն�������ʾ
                //$time��ʾ����ϵͳʱ��
                $display("LED output mis-matched at ",$time,":expected:%b,actual:%b",e_led, leds);
        end
    end
endmodule
