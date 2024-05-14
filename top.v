module top(input clk,
           input ps2_clk,
           input ps2_data,
           input internal_reset_lcd,
           output rs,
           output e,
           output [7:0] d
           );
wire [7:0]d_i_p2a;
wire [8:0]d_i_lcd;
wire data_ready;
wire busy_flag;
keyboard kb(clk,ps2_data,ps2_clk,d_i_p2a);
ps2_to_ascii p2a(d_i_p2a,d_i_lcd[7:0],d_i_lcd[8]);
lcd l(clk,internal_reset_lcd,d_i_lcd,data_ready,rs,e,d,busy_flag);
controller ctl(clk,busy_flag,internal_reset_lcd,data_ready);
endmodule
