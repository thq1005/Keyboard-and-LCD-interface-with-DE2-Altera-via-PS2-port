module keyboard (input clk,
					  input ps2_data,
					  input ps2_clk,
					  output reg [7:0] data_o);

parameter idle    = 2'b01;
parameter receive = 2'b10;
parameter ready   = 2'b11;


reg [1:0]  state = idle;
reg [15:0] rxtimeout = 16'b0000000000000000;
reg [10:0] rxregister = 11'b11111111111;
reg [1:0]  clksr = 2'b11;
reg [7:0]  rxdata = 8'b00000000; 
					  
reg datafetched = 0;

always @(posedge clk) begin
	if(datafetched==1)
		data_o <= rxdata;
end

always @(posedge clk) begin
	rxtimeout <= rxtimeout + 1;
	clksr <= {clksr[0], ps2_clk};
	
	if (clksr==2'b10)
		rxregister <= {ps2_data,rxregister[10:1]};
		
	case (state)
		idle:
		begin
			rxregister <= 11'b11111111111;
			rxtimeout  <= 16'b0000000000000000;
			if(ps2_data==0 && clksr[1]==1)
			begin 
				state <= receive;
			end
		end
		
		receive:
		begin
      if(rxtimeout==50000)
        state<=idle;
      else if(rxregister[0]==0)
			begin
			  rxdata<=rxregister[8:1];
			  state<=ready;
			  datafetched<=1;
			end
		end
		
		ready: 
		begin
			if(datafetched==1)
			begin
				state     <=idle;
			end  
		end  
		endcase
end
endmodule 