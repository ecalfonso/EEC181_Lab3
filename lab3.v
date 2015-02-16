module lab3(
	// Clocks
	CLOCK_50, CLOCK2_50,
	
	// SDRAM
	DRAM_ADDR, DRAM_BA, DRAM_CAS_N, DRAM_CKE, DRAM_CS_N, DRAM_DQ, DRAM_LDQM, DRAM_RAS_N, DRAM_UDQM, DRAM_WE_N, 
	DRAM_CLK,
	
	// VGA
	VGA_B, VGA_BLANK_N, VGA_CLK, VGA_G, VGA_HS, VGA_R, VGA_SYNC_N, VGA_VS,
	
	// DDR3SDRAM
	HPS_DDR3_ADDR, HPS_DDR3_BA, HPS_DDR3_CAS_N, HPS_DDR3_CKE, HPS_DDR3_CK_N, HPS_DDR3_CK_P, HPS_DDR3_CS_N,
	HPS_DDR3_DM, HPS_DDR3_DQ, HPS_DDR3_DQS_N, HPS_DDR3_DQS_P, HPS_DDR3_ODT, HPS_DDR3_RAS_N, HPS_DDR3_RESET_N,
	HPS_DDR3_RZQ, HPS_DDR3_WE_N,
	
	// PIO
	SW, KEY, LEDR,
	HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
); // Lab3test module

input CLOCK_50;
input CLOCK2_50;

// PIO
input [9:0] SW;
input [3:0] KEY;
output [9:0] LEDR;
output [0:6] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

// SDRAM
output [12:0] DRAM_ADDR;
output [1:0] DRAM_BA;
output DRAM_CAS_N;
output DRAM_CKE;
output DRAM_CLK;
output DRAM_CS_N;
inout [15:0] DRAM_DQ;
output DRAM_LDQM;
output DRAM_RAS_N;
output DRAM_UDQM;
output DRAM_WE_N;

// VGA
output [7:0] VGA_B;
output [7:0] VGA_G;
output [7:0] VGA_R;
output VGA_BLANK_N;
output VGA_CLK;
output VGA_HS;
output VGA_SYNC_N;
output VGA_VS;

// DDR_SDRAM
output [14:0] HPS_DDR3_ADDR;
output [2:0] HPS_DDR3_BA;
output [3:0] HPS_DDR3_DM;
inout [31:0] HPS_DDR3_DQ;
inout [3:0] HPS_DDR3_DQS_N;
inout [3:0] HPS_DDR3_DQS_P;
output HPS_DDR3_CAS_N;
output HPS_DDR3_CKE;
output HPS_DDR3_CK_N;
output HPS_DDR3_CK_P;
output HPS_DDR3_CS_N;
output HPS_DDR3_ODT;
output HPS_DDR3_RAS_N;
output HPS_DDR3_RESET_N;
output HPS_DDR3_WE_N;
input HPS_DDR3_RZQ;

wire [31:0] hexp1;
wire [31:0] hexp2;
wire [9:0] leds;

hex7seg(hexp1[3:0], HEX0);
hex7seg(hexp1[7:4], HEX1);
hex7seg(hexp1[11:8], HEX2);
hex7seg(hexp2[3:0], HEX3);
hex7seg(hexp2[7:4], HEX4);
hex7seg(hexp2[11:8], HEX5);

assign LEDR[9:0] = leds;

    mysys u0 (
		  .system_ref_clk_clk      (CLOCK_50),      //    system_ref_clk.clk
        .system_ref_reset_reset  (SW[3]),  //  system_ref_reset.reset
	 
			// DDR3 SDRAM
        .memory_mem_a            (HPS_DDR3_ADDR),            //            memory.mem_a
        .memory_mem_ba           (HPS_DDR3_BA),           //                  .mem_ba
        .memory_mem_ck           (HPS_DDR3_CK_P),           //                  .mem_ck
        .memory_mem_ck_n         (HPS_DDR3_CK_N),         //                  .mem_ck_n
        .memory_mem_cke          (HPS_DDR3_CKE),          //                  .mem_cke
        .memory_mem_cs_n         (HPS_DDR3_CS_N),         //                  .mem_cs_n
        .memory_mem_ras_n        (HPS_DDR3_RAS_N),        //                  .mem_ras_n
        .memory_mem_cas_n        (HPS_DDR3_CAS_N),        //                  .mem_cas_n
        .memory_mem_we_n         (HPS_DDR3_WE_N),         //                  .mem_we_n
        .memory_mem_reset_n      (HPS_DDR3_RESET_N),      //                  .mem_reset_n
        .memory_mem_dq           (HPS_DDR3_DQ),           //                  .mem_dq
        .memory_mem_dqs          (HPS_DDR3_DQS_P),          //                  .mem_dqs
        .memory_mem_dqs_n        (HPS_DDR3_DQS_N),        //                  .mem_dqs_n
        .memory_mem_odt          (HPS_DDR3_ODT),          //                  .mem_odt
        .memory_mem_dm           (HPS_DDR3_DM),           //                  .mem_dm
        .memory_oct_rzqin        (HPS_DDR3_RZQ),        //                  .oct_rzqin
        
		  // VGA
		  .vga_pll_ref_clk_clk     (CLOCK2_50),     //   vga_pll_ref_clk.clk
        .vga_pll_ref_reset_reset (SW[3]), // vga_pll_ref_reset.reset
        .vga_CLK                 (VGA_CLK),                 //               vga.CLK
        .vga_HS                  (VGA_HS),                  //                  .HS
        .vga_VS                  (VGA_VS),                  //                  .VS
        .vga_BLANK               (VGA_BLANK_N),               //                  .BLANK
        .vga_SYNC                (VGA_SYNC_N),                //                  .SYNC
        .vga_R                   (VGA_R),                   //                  .R
        .vga_G                   (VGA_G),                   //                  .G
        .vga_B                   (VGA_B),                    //		 				  .B
		  
		  // SDRAM
		  .sdram_clk_clk           (DRAM_CLK),           //         sdram_clk.clk
		  .sdram_addr              (DRAM_ADDR),              //             sdram.addr
        .sdram_ba                (DRAM_BA),                //                  .ba
        .sdram_cas_n             (DRAM_CAS_N),             //                  .cas_n
        .sdram_cke               (DRAM_CKE),               //                  .cke
        .sdram_cs_n              (DRAM_CS_N),              //                  .cs_n
        .sdram_dq                (DRAM_DQ),                //                  .dq
        .sdram_dqm               ({DRAM_UDQM, DRAM_LDQM}),               //                  .dqm
        .sdram_ras_n             (DRAM_RAS_N),             //                  .ras_n
        .sdram_we_n              (DRAM_WE_N),               //                  .we_n
		  
		  // PIO		  
		  .switch_export           (SW),           //            switch.export
		  .leds_export             (leds),             //              leds.export
        .hex_p2_export           (hexp2),           //            hex_p2.export
        .hex_p1_export           (hexp1),           //            hex_p1.export
        .key0_export             (right),             //              key0.export
        .key1_export             (down),             //              key1.export
        .key2_export             (up),             //              key2.export
        .key3_export             (left)              //              key3.export
    );

integer right = 0;
integer down = 0;
integer up = 0;
integer left = 0;
always @ (negedge KEY[0]) begin
	right = right + 1;
end
always @ (negedge KEY[1]) begin
	down = down + 1;
end
always @ (negedge KEY[2]) begin
	up = up + 1;
end
always @ (negedge KEY[3]) begin
	left = left + 1;
end

	 
endmodule 