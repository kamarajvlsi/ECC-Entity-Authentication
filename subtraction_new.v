module subtra(a,b,cin,o,signbit);
  input [255:0]a,b;
  input cin;
  output [255:0]o;
  output signbit;
  wire [255:0]r,f,i;
  wire carryout;
  twoscomplement w(b,r);
  fullmodu q(a,r,1'b0,f,carryout);
  twoscomplement e(f,i);
  mux1 p(o,f,i,carryout);
  muxonebit y(signbit,1'b1,1'b0,carryout);
endmodule
module twoscomplement(f,i);
  input [255:0]f;
  output [255:0]i;
  assign i=(~f)+1'b1;
endmodule
module muxonebit (o,a,b,s);
  input a,b;
  output reg  o;
  input s;
  always@(*)
  begin
    case(s)
      1'b0:o=a;
    1'b1:o=b;
    default :o=1'b0;
  endcase
end
endmodule
module mux1(c,a,b,s,clk);
  input [255:0]a,b;
  
  input s;
  input clk;
  output reg [255:0]c;
  always @(s)
  begin 
   
  case(s)
    1'b0:c=a;
    1'b1:c=b;
    default :c=256'b0;
  endcase
  end
endmodule
module fulladder(X, Y, Ci, S, Co);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  //Structural code for one bit full adder
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule	
module rippe_adder(X, Y,Cin, S,co);
 input [7:0] X, Y;
 output [7:0] S;
 output co;
 input Cin;
 wire w1,w2,w3,w4,w5,w6,w7;
 
 //instantiating 4 1-bit full adders in Verilog
 fulladder u1(X[0], Y[0],Cin, S[0], w1);
 fulladder u2(X[1], Y[1], w1, S[1], w2);
 fulladder u3(X[2], Y[2], w2, S[2], w3);
 fulladder u4(X[3], Y[3], w3, S[3], w4);
 fulladder u5(X[4], Y[4], w4, S[4], w5);
 fulladder u6(X[5], Y[5], w5, S[5], w6);
 fulladder u7(X[6], Y[6], w6, S[6], w7);
 fulladder u8(X[7], Y[7], w7, S[7], co);
 endmodule
module fullmodu(a,b,out,cm);
  input [255:0]a,b;
  output cm;
  output [255:0]out;
  wire w[30:0];
  rippe_adder u1(a[7:0],b[7:0],1'b0,out[7:0],w[0]);
  rippe_adder u2(a[15:8],b[15:8],w[0],out[15:8],w[1]);
  rippe_adder u3(a[23:16],b[23:16],w[1],out[23:16],w[2]);
  rippe_adder u4(a[31:24],b[31:24],w[2],out[31:24],w[3]);
  rippe_adder u5(a[39:32],b[39:32],w[3],out[39:32],w[4]);
  rippe_adder u6(a[47:40],b[47:40],w[4],out[47:40],w[5]);
  rippe_adder u7(a[55:48],b[55:48],w[5],out[55:48],w[6]);
  rippe_adder u8(a[63:56],b[63:56],w[6],out[63:56],w[7]);
  rippe_adder u9(a[71:64],b[71:64],w[7],out[71:64],w[8]);
  rippe_adder u10(a[79:72],b[79:72],w[8],out[79:72],w[9]);
  rippe_adder u11(a[87:80],b[87:80],w[9],out[87:80],w[10]);
  rippe_adder u12(a[95:88],b[95:88],w[10],out[95:88],w[11]);
  rippe_adder u13(a[103:96],b[103:96],w[11],out[103:96],w[12]);
  rippe_adder u14(a[111:104],b[111:104],w[12],out[111:104],w[13]);
  rippe_adder u15(a[119:112],b[119:112],w[13],out[119:112],w[14]);
  rippe_adder u16(a[127:120],b[127:120],w[14],out[127:120],w[15]);
  rippe_adder u17(a[135:128],b[135:128],w[15],out[135:128],w[16]);
  rippe_adder u18(a[143:136],b[143:136],w[16],out[143:136],w[17]);
  rippe_adder u19(a[151:144],b[151:144],w[17],out[151:144],w[18]);
  rippe_adder u20(a[159:152],b[159:152],w[18],out[159:152],w[19]);
  rippe_adder u21(a[167:160],b[167:160],w[19],out[167:160],w[20]);
  rippe_adder u22(a[175:168],b[175:168],w[20],out[175:168],w[21]);
  rippe_adder u23(a[183:176],b[183:176],w[21],out[183:176],w[22]);
  rippe_adder u24(a[191:184],b[191:184],w[22],out[191:184],w[23]);
  rippe_adder u25(a[199:192],b[199:192],w[23],out[199:192],w[24]);
  rippe_adder u26(a[207:200],b[207:200],w[24],out[207:200],w[25]);
  rippe_adder u27(a[215:208],b[215:208],w[25],out[215:208],w[26]);
  rippe_adder u28(a[223:216],b[223:216],w[26],out[223:216],w[27]);
  rippe_adder u29(a[231:224],b[231:224],w[27],out[231:224],w[28]);
  rippe_adder u30(a[239:232],b[239:232],w[28],out[239:232],w[29]);
  rippe_adder u31(a[247:240],b[247:240],w[29],out[247:240],w[30]);
  rippe_adder u32(a[255:248],b[255:248],w[30],out[255:248],cm);
endmodule
