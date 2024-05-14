module controller(input clk,
                  input lcd_busy,
                  input internal_reset,
                  input [7:0]d_i,
                  output reg data_ready);
reg r = 0;              
always@(posedge clk) begin
  if(internal_reset)begin
    data_ready<=1'b0;
    r <= 0;
  end
  if (lcd_busy == 1)
    data_ready <= 0;
  if (!lcd_busy && d_i == 8'hF0)
    r <= 1;
  if (r == 1 && d_i != 8'hF0) begin
    data_ready <= 1;  
    r <= 0;  
  end
end
endmodule 