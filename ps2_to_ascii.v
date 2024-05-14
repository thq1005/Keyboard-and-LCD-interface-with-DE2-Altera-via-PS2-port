module ps2_to_ascii(
    input [7:0] ps2_code,
    output reg [7:0] lcd_dbOut,
    output reg rsOut
);

always@* begin
    case (ps2_code)
        8'h5A : rsOut = 1'b0; // --^?  ENTER
        default : rsOut = 1'b1;
    endcase
end

always@* begin
    case(ps2_code)
        8'h1C : lcd_dbOut = 8'h61; // --a
        8'h32 : lcd_dbOut = 8'h62; // --b
        8'h21 : lcd_dbOut = 8'h63; // --c
        8'h23 : lcd_dbOut = 8'h64; // --d
        8'h24 : lcd_dbOut = 8'h65; // --e
        8'h2B : lcd_dbOut = 8'h66; // --f
        8'h34 : lcd_dbOut = 8'h67; // --g
        8'h33 : lcd_dbOut = 8'h68; // --h
        8'h43 : lcd_dbOut = 8'h69; // --i
        8'h3B : lcd_dbOut = 8'h6A; // --j
        8'h42 : lcd_dbOut = 8'h6B; // --k
        8'h4B : lcd_dbOut = 8'h6C; // --l
        8'h3A : lcd_dbOut = 8'h6D; // --m
        8'h31 : lcd_dbOut = 8'h6E; // --n
        8'h44 : lcd_dbOut = 8'h6F; // --o
        8'h4D : lcd_dbOut = 8'h70; // --p
        8'h15 : lcd_dbOut = 8'h71; // --q
        8'h2D : lcd_dbOut = 8'h72; // --r
        8'h1B : lcd_dbOut = 8'h73; // --s
        8'h2C : lcd_dbOut = 8'h74; // --t
        8'h3C : lcd_dbOut = 8'h75; // --u
        8'h2A : lcd_dbOut = 8'h76; // --v
        8'h1D : lcd_dbOut = 8'h77; // --w
        8'h22 : lcd_dbOut = 8'h78; // --x
        8'h35 : lcd_dbOut = 8'h79; // --y
        8'h1A : lcd_dbOut = 8'h7A; // --z
        8'h45 : lcd_dbOut = 8'h30; // --0
        8'h16 : lcd_dbOut = 8'h31; // --1
        8'h1E : lcd_dbOut = 8'h32; // --2
        8'h26 : lcd_dbOut = 8'h33; // --3
        8'h25 : lcd_dbOut = 8'h34; // --4
        8'h2E : lcd_dbOut = 8'h35; // --5
        8'h36 : lcd_dbOut = 8'h36; // --6
        8'h3D : lcd_dbOut = 8'h37; // --7
        8'h3E : lcd_dbOut = 8'h38; // --8
        8'h46 : lcd_dbOut = 8'h39; // --9
        8'h5A : lcd_dbOut = 8'hC0; // --ENTER
        8'h29 : lcd_dbOut = 8'h20; // --SPACE
        8'hF0 : lcd_dbOut = 8'hF0; // --^?  DEL
        default : lcd_dbOut = 8'hF0;
    endcase
end

endmodule
