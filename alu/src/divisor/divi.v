`timescale 1ns / 1ps


module divi( input [2:0] DV,
							input [2:0] DR,
						   	input init,
							 input clk,
							 output  reg [2:0] DP
    );


reg done;
reg sh;
reg rst;
reg resta;
reg [1:0] cont;
reg [5:0] C;
wire z;

reg [3:0] status =0;

assign z=(cont==0)?1:0;


  always @(negedge clk) begin

	if (rst) begin
      C ={3'b000,DV};
		cont= 3;
	end
	else	begin
		if (sh) begin
			C= C << 1;
          if(cont>0) begin
			cont = cont-1;
          end
		end
	if (resta) begin
	   C[0]=1;
       C[5:3] = C[5:3]-DR;
    end
	end
	end


// FSM
parameter START =0,  SHIFT =1, RESTA =2, CHECK=3, END1 =4, CHECK2= 5;

always @(posedge clk) begin
	case (status)
	START: begin
	   resta=0;
	   sh=0;
	if(init) begin
		status=SHIFT;
		done=0;
	    rst=1;
	end
	end

	SHIFT: begin
		resta=0;
	    sh=1;
	    done=0;
	    rst=0;
		status=CHECK;
		end

	CHECK: begin
	    done=0;
	    resta=0;
	    rst=0;
        sh=0;
        if( C[5:3]<DR )begin
            status=CHECK2;
        end else
            status=RESTA;
		end

	RESTA: begin
	    done=0;
	    resta=1;
	    rst=0;
	    sh=0;
	    status=CHECK2;
		end

	CHECK2: begin
	    done=0;
	    resta=0;
	    rst=0;
	    sh=0;
	    if(z)begin
	       status=END1;
	   end else
		status=SHIFT;
	end

	END1: begin
	    done=1;
	    resta=0;
	    rst=1;
	    sh=0;
        DP = C[2:0];
	    status =START;
		end

	 default:
		status =START;
	endcase

end


endmodule
