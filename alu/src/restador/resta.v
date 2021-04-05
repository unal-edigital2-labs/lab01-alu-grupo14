`timescale 1ns / 1ps


module resta(init, x, y,sal);

  input init;
  input [3 :0] x;
  input [3 :0] y;
  output [3 :0] sal;


  wire [3:0] st;
  wire [3:0] const;

  assign const = ~y;
  assign sal= st[3:0];

  assign st  = 	x+const+1;

endmodule
