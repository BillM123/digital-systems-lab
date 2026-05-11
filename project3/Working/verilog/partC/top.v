module vga_controller (
    clk, reset, VGA_RED, VGA_GREEN, VGA_BLUE, VGA_HSYNC, VGA_VSYNC
);
    
    input reset, clk;
    
    output VGA_RED, VGA_GREEN, VGA_BLUE;
    output VGA_HSYNC, VGA_VSYNC;

    wire rstout;

    wire [13:0] address;
    wire [6:0] HPIXEL;
    wire [6:0] VPIXEL;
    wire pixel_ok;
    
    antibounce reset_sync_nobounce(reset, clk, rstout);
    hsync hsync_inst(clk, rstout, HRGB, VGA_HSYNC, HPIXEL, pixel_ok);
    vsync vsync_inst(clk, rstout, pixel_ok, VRGB, VGA_VSYNC, VPIXEL);
    vram vram_inst(clk, rstout, address, red, green, blue);

    assign address = {VPIXEL, HPIXEL};

    assign VGA_RED   = (VRGB && HRGB) ? red   : 0;
    assign VGA_GREEN = (VRGB && HRGB) ? green : 0;
    assign VGA_BLUE  = (VRGB && HRGB) ? blue  : 0;
    
endmodule
