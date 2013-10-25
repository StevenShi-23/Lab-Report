module alu(A, B, op, out, imm);
  
  input signed [15:0] A, B;
  input [2:0] 	       op;
  input [3:0] 	       imm;
  output [15:0]       out;
  //output [2:0]        flag;
  reg [15:0] out;
  always @(A or B or op)
  begin
    case (op)
      3'b000: out = A + B;
      3'b001: out = A - B;
      3'b010: out = A & B;
      3'b011: out = A | B;
      3'b100: out = A << imm;
      3'b101: out = A >> imm;
      3'b110: out = A >>> imm;
      3'b111: out = {A << imm | A >> (16 - imm)};
      default: out = 16'd0;
    endcase
  end
  
endmodule 
