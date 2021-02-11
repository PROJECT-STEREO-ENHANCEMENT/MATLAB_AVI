`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.01.2021 15:18:55
// Design Name: 
// Module Name: read1
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


module read1(

    );
    
        reg signed [15:0] A=0; //register declaration for storing each line of file.
    reg CLK;
    reg signed [23:0] Yout;
    
    //wire signed   [7:0] H0,H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16,H17,H18,H19,H20,H21,H22,H23,H24,H25,H26,H27,H28,H29,H30,H31;
    wire signed   [23:0] MCM0,MCM1,MCM2,MCM3,MCM4,MCM5,MCM6,MCM7,MCM8,MCM9,MCM10,MCM11,MCM12,MCM13,MCM14,MCM15,MCM16,MCM17,MCM18,MCM19,MCM20,MCM21,MCM22,MCM23,MCM24,MCM25,MCM26,MCM27,MCM28,MCM29,MCM30,MCM31;
    wire signed   [23:0] add_out1,add_out2,add_out3,add_out4,add_out5,add_out6,add_out7,add_out8,add_out9,add_out10,add_out11,add_out12,add_out13,add_out14,add_out15,add_out16,add_out17,add_out18,add_out19,add_out20,add_out21,add_out22,add_out23,add_out24,add_out25,add_out26,add_out27,add_out28,add_out29,add_out30,add_out31;
    wire signed     [23:0] Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31;
    
    
integer               data_file    ; // file handler
integer               scan_file    ; // file handler

integer               output_l=0        ;


reg signed [15:0] captured_data;
`define NULL 0    

//filter coefficient initializations.
//H = [-2 -1 3 4].
    parameter H0 =  0;
    parameter H1 =   0.000000000000000000204489006579983278866;
    parameter H2 =   0.002105890861031976639405893791945345583;
    parameter H3 =   0.008241696270537652788124027836147433845;
    parameter H4 =   0.016851511564314091556893160372965212446 ;
    parameter H5 =   0.022525795121577478485885848158432054333;
    parameter H6 =   0.018346399860948870569332669333562080283 ;
    parameter H7 =   -0.000000000000000012849147728276634831777;
    parameter H8 = -0.030512360823790593555848715823231032118;
    parameter H9 = -0.063850594474922250931570033571915701032;
    parameter H10= -0.086106702705328247438032462923729326576;
    parameter H11= -0.084561998463031320949490066141152055934;
    parameter H12= -0.053925318750837065995273889029704150744;
    parameter H13=  0.000000000000000038982135514914218509712;
    parameter H14=  0.06129729947042233950682543763832654804 ;
    parameter H15=  0.109544946924648597952334228011750383303;
    parameter H16=  0.127809878143602062561257071138243190944;
    parameter H17=  0.109544946924648597952334228011750383303;
    parameter H18=  0.06129729947042233950682543763832654804 ;
    parameter H19=  0.000000000000000038982135514914218509712;
    parameter H20= -0.053925318750837065995273889029704150744;
    parameter H21= -0.084561998463031320949490066141152055934;
    parameter H22= -0.086106702705328247438032462923729326576;
    parameter H23= -0.063850594474922250931570033571915701032;
    parameter H24= -0.030512360823790593555848715823231032118;
    parameter H25= -0.000000000000000012849147728276634831777;
    parameter H26=  0.018346399860948870569332669333562080283;
    parameter H27=  0.022525795121577478485885848158432054333;
    parameter H28=  0.016851511564314091556893160372965212446;
    parameter H29=  0.008241696270537652788124027836147433845;
    parameter H30=  0.002105890861031976639405893791945345583;
    parameter H31=  0.000000000000000000204489006579983278866;
    
    
//    assign H0 =  0;
//    assign H1 =   0.000000000000000000204489006579983278866;
//    assign H2 =   0.002105890861031976639405893791945345583;
//    assign H3 =   0.008241696270537652788124027836147433845;
//    assign H4 =   0.016851511564314091556893160372965212446 ;
//    assign H5 =   0.022525795121577478485885848158432054333;
//    assign H6 =   0.018346399860948870569332669333562080283 ;
//    assign H7 =   -0.000000000000000012849147728276634831777;
//    assign H8 = -0.030512360823790593555848715823231032118;
//    assign H9 = -0.063850594474922250931570033571915701032;
//    assign H10= -0.086106702705328247438032462923729326576;
//    assign H11= -0.084561998463031320949490066141152055934;
//    assign H12= -0.053925318750837065995273889029704150744;
//    assign H13=  0.000000000000000038982135514914218509712;
//    assign H14=  0.06129729947042233950682543763832654804 ;
//    assign H15=  0.109544946924648597952334228011750383303;
//    assign H16=  0.127809878143602062561257071138243190944;
//    assign H17=  0.109544946924648597952334228011750383303;
//    assign H18=  0.06129729947042233950682543763832654804 ;
//    assign H19=  0.000000000000000038982135514914218509712;
//    assign H20= -0.053925318750837065995273889029704150744;
//    assign H21= -0.084561998463031320949490066141152055934;
//    assign H22= -0.086106702705328247438032462923729326576;
//    assign H23= -0.063850594474922250931570033571915701032;
//    assign H24= -0.030512360823790593555848715823231032118;
//    assign H25= -0.000000000000000012849147728276634831777;
//    assign H26=  0.018346399860948870569332669333562080283;
//    assign H27=  0.022525795121577478485885848158432054333;
//    assign H28=  0.016851511564314091556893160372965212446;
//    assign H29=  0.008241696270537652788124027836147433845;
//    assign H30=  0.002105890861031976639405893791945345583;
//    assign H31=  0.000000000000000000204489006579983278866;

//Multiple constant multiplications.
    assign MCM31= H31*A;
    assign MCM30= H30*A;
    assign MCM29= H29*A;
    assign MCM28= H28*A;
    assign MCM27= H27*A;
    assign MCM26= H26*A;
    assign MCM25= H25*A;
    assign MCM24= H24*A;
    assign MCM23= H23*A;
    assign MCM22= H22*A;
    assign MCM21= H21*A;
    assign MCM20= H20*A;
    assign MCM19= H19*A;
    assign MCM18= H18*A;
    assign MCM17= H17*A;
    assign MCM16= H16*A;
    assign MCM15= H15*A;
    assign MCM14= H14*A;
    assign MCM13= H13*A;
    assign MCM12= H12*A;
    assign MCM11= H11*A;
    assign MCM10= H10*A;
    assign MCM9 = H9*A;
    assign MCM8 = H8*A;
    assign MCM7 = H7*A;
    assign MCM6 = H6*A;
    assign MCM5 = H5*A;
    assign MCM4 = H4*A;
    assign MCM3 = H3*A;
    assign MCM2 = H2*A;
    assign MCM1 = H1*A;
    assign MCM0 = H0*A;
    
    
//adders
    assign add_out1 = Q1 + MCM30;
    assign add_out2 = Q2 + MCM29;
    assign add_out3 = Q3 + MCM28;
    assign add_out4 = Q4 + MCM27;
    assign add_out5 = Q5 + MCM26;
    assign add_out6 = Q6 + MCM25;
    assign add_out7 = Q7 + MCM24;
    assign add_out8 = Q8 + MCM23;
    assign add_out9 = Q9 + MCM22;    
    assign add_out10 = Q10 + MCM21;
    assign add_out11 = Q11 + MCM20;
    assign add_out12 = Q12 + MCM19;
    assign add_out13 = Q13 + MCM18;
    assign add_out14 = Q14 + MCM17;
    assign add_out15 = Q15 + MCM16;
    assign add_out16 = Q16 + MCM15;
    assign add_out17 = Q17 + MCM14;
    assign add_out18 = Q18 + MCM13;
    assign add_out19 = Q19 + MCM12;    
    assign add_out20 = Q20 + MCM11;
    assign add_out21 = Q21 + MCM10;
    assign add_out22 = Q22 + MCM9;
    assign add_out23 = Q23 + MCM8;
    assign add_out24 = Q24 + MCM7;
    assign add_out25 = Q25 + MCM6;
    assign add_out26 = Q26 + MCM5;
    assign add_out27 = Q27 + MCM4;
    assign add_out28 = Q28 + MCM3;
    assign add_out29 = Q29 + MCM2;    
    assign add_out30 = Q30 + MCM1;
    assign add_out31 = Q31 + MCM0;    

        

    DFF dff1  (.Clk(CLK),.D(MCM31),.Q(Q1));
    DFF dff2  (.Clk(CLK),.D(add_out1),.Q(Q2));
    DFF dff3  (.Clk(CLK),.D(add_out2),.Q(Q3));
    DFF dff4  (.Clk(CLK),.D(add_out3),.Q(Q4));
    DFF dff5  (.Clk(CLK),.D(add_out4),.Q(Q5));
    DFF dff6  (.Clk(CLK),.D(add_out5),.Q(Q6));
    DFF dff7  (.Clk(CLK),.D(add_out6),.Q(Q7));
    DFF dff8  (.Clk(CLK),.D(add_out7),.Q(Q8));
    DFF dff9  (.Clk(CLK),.D(add_out8),.Q(Q9));
    DFF dff10 (.Clk(CLK),.D(add_out9),.Q(Q10));
    DFF dff11 (.Clk(CLK),.D(add_out10),.Q(Q11));
    DFF dff12 (.Clk(CLK),.D(add_out11),.Q(Q12));
    DFF dff13 (.Clk(CLK),.D(add_out12),.Q(Q13));
    DFF dff14 (.Clk(CLK),.D(add_out13),.Q(Q14));
    DFF dff15 (.Clk(CLK),.D(add_out14),.Q(Q15));
    DFF dff16 (.Clk(CLK),.D(add_out15),.Q(Q16));
    DFF dff17 (.Clk(CLK),.D(add_out16),.Q(Q17));
    DFF dff18 (.Clk(CLK),.D(add_out17),.Q(Q18));
    DFF dff19 (.Clk(CLK),.D(add_out18),.Q(Q19));
    DFF dff20 (.Clk(CLK),.D(add_out19),.Q(Q20));
    DFF dff21 (.Clk(CLK),.D(add_out20),.Q(Q21));
    DFF dff22 (.Clk(CLK),.D(add_out21),.Q(Q22));
    DFF dff23 (.Clk(CLK),.D(add_out22),.Q(Q23));
    DFF dff24 (.Clk(CLK),.D(add_out23),.Q(Q24));
    DFF dff25 (.Clk(CLK),.D(add_out24),.Q(Q25));
    DFF dff26 (.Clk(CLK),.D(add_out25),.Q(Q26));
    DFF dff27 (.Clk(CLK),.D(add_out26),.Q(Q27));
    DFF dff28 (.Clk(CLK),.D(add_out27),.Q(Q28));
    DFF dff29 (.Clk(CLK),.D(add_out28),.Q(Q29));
    DFF dff30 (.Clk(CLK),.D(add_out29),.Q(Q30));
    DFF dff31 (.Clk(CLK),.D(add_out30),.Q(Q31));

initial begin
  data_file = $fopen("v1.txt", "r");
  if (data_file == `NULL) begin
    $display("data_file handle was NULL");
    $finish;
  end
  output_l=$fopen("output_l.txt","w");
end

always @(posedge CLK) begin
  scan_file = $fscanf(data_file, "%b\n",captured_data ); 
  if (!$feof(data_file)) 
  begin
     A<= captured_data;//use captured_data as you would any other wire or reg value;
  end
end

    always@ (posedge CLK)
    begin
        Yout <= add_out31;
        $fwrite(output_l, "%b\n",Yout);  
    end
endmodule
