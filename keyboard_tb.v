`timescale 1ns / 1ps

module keyboard_tb;

  reg clk;
  reg ps2_data;
  reg ps2_clk;
  wire [7:0] data_o;

  // Instantiate the module under test
  keyboard uut (
    .clk(clk),
    .ps2_data(ps2_data),
    .ps2_clk(ps2_clk),
    .data_o(data_o)
  );

  // Clock generation (50 MHz)
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end

  // PS/2 data generation 
  initial begin
    ps2_data = 1;
    #50 ps2_data = 0;
    #400 ps2_data = 1;
    #300 ps2_data = 0;
    #300 ps2_data = 1;
    #100 ps2_data = 0;  
  end

  // PS/2 clock generation 
  initial begin
    ps2_clk = 1;
    #100 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
    #50 ps2_clk = 0;
    #50 ps2_clk = 1;
  end

  // Simulation duration
  initial #10000 $finish;

endmodule
