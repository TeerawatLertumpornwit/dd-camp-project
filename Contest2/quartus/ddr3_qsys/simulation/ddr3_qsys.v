// ddr3_qsys.v

// Generated using ACDS version 17.1 590

`timescale 1 ps / 1 ps
module ddr3_qsys (
		output wire        avl_ddr0_waitrequest,         //   avl_ddr0.waitrequest
		output wire [63:0] avl_ddr0_readdata,            //           .readdata
		output wire        avl_ddr0_readdatavalid,       //           .readdatavalid
		input  wire [4:0]  avl_ddr0_burstcount,          //           .burstcount
		input  wire [63:0] avl_ddr0_writedata,           //           .writedata
		input  wire [28:0] avl_ddr0_address,             //           .address
		input  wire        avl_ddr0_write,               //           .write
		input  wire        avl_ddr0_read,                //           .read
		input  wire [7:0]  avl_ddr0_byteenable,          //           .byteenable
		input  wire        avl_ddr0_debugaccess,         //           .debugaccess
		output wire        avl_ddr1_waitrequest,         //   avl_ddr1.waitrequest
		output wire [63:0] avl_ddr1_readdata,            //           .readdata
		output wire        avl_ddr1_readdatavalid,       //           .readdatavalid
		input  wire [4:0]  avl_ddr1_burstcount,          //           .burstcount
		input  wire [63:0] avl_ddr1_writedata,           //           .writedata
		input  wire [28:0] avl_ddr1_address,             //           .address
		input  wire        avl_ddr1_write,               //           .write
		input  wire        avl_ddr1_read,                //           .read
		input  wire [7:0]  avl_ddr1_byteenable,          //           .byteenable
		input  wire        avl_ddr1_debugaccess,         //           .debugaccess
		input  wire        clk_clk,                      //        clk.clk
		input  wire        mem_clk_clk,                  //    mem_clk.clk
		input  wire        mem_reset_reset_n,            //  mem_reset.reset_n
		output wire        mem_status_local_init_done,   // mem_status.local_init_done
		output wire        mem_status_local_cal_success, //           .local_cal_success
		output wire        mem_status_local_cal_fail,    //           .local_cal_fail
		output wire [14:0] memory_mem_a,                 //     memory.mem_a
		output wire [2:0]  memory_mem_ba,                //           .mem_ba
		inout  wire [0:0]  memory_mem_ck,                //           .mem_ck
		inout  wire [0:0]  memory_mem_ck_n,              //           .mem_ck_n
		output wire [0:0]  memory_mem_cke,               //           .mem_cke
		output wire [0:0]  memory_mem_cs_n,              //           .mem_cs_n
		output wire [1:0]  memory_mem_dm,                //           .mem_dm
		output wire [0:0]  memory_mem_ras_n,             //           .mem_ras_n
		output wire [0:0]  memory_mem_cas_n,             //           .mem_cas_n
		output wire [0:0]  memory_mem_we_n,              //           .mem_we_n
		output wire        memory_mem_reset_n,           //           .mem_reset_n
		inout  wire [15:0] memory_mem_dq,                //           .mem_dq
		inout  wire [1:0]  memory_mem_dqs,               //           .mem_dqs
		inout  wire [1:0]  memory_mem_dqs_n,             //           .mem_dqs_n
		output wire [0:0]  memory_mem_odt,               //           .mem_odt
		input  wire        reset_reset_n                 //      reset.reset_n
	);

	wire         ddr3_controller_afi_clk_clk;                              // ddr3_controller:afi_clk -> [mm_clock_crossing_bridge_0:m0_clk, mm_clock_crossing_bridge_1:m0_clk, mm_interconnect_0:ddr3_controller_afi_clk_clk, rst_controller:clk, rst_controller_001:clk]
	wire         mm_clock_crossing_bridge_1_m0_waitrequest;                // mm_interconnect_0:mm_clock_crossing_bridge_1_m0_waitrequest -> mm_clock_crossing_bridge_1:m0_waitrequest
	wire  [63:0] mm_clock_crossing_bridge_1_m0_readdata;                   // mm_interconnect_0:mm_clock_crossing_bridge_1_m0_readdata -> mm_clock_crossing_bridge_1:m0_readdata
	wire         mm_clock_crossing_bridge_1_m0_debugaccess;                // mm_clock_crossing_bridge_1:m0_debugaccess -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_debugaccess
	wire  [28:0] mm_clock_crossing_bridge_1_m0_address;                    // mm_clock_crossing_bridge_1:m0_address -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_address
	wire         mm_clock_crossing_bridge_1_m0_read;                       // mm_clock_crossing_bridge_1:m0_read -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_read
	wire   [7:0] mm_clock_crossing_bridge_1_m0_byteenable;                 // mm_clock_crossing_bridge_1:m0_byteenable -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_byteenable
	wire         mm_clock_crossing_bridge_1_m0_readdatavalid;              // mm_interconnect_0:mm_clock_crossing_bridge_1_m0_readdatavalid -> mm_clock_crossing_bridge_1:m0_readdatavalid
	wire  [63:0] mm_clock_crossing_bridge_1_m0_writedata;                  // mm_clock_crossing_bridge_1:m0_writedata -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_writedata
	wire         mm_clock_crossing_bridge_1_m0_write;                      // mm_clock_crossing_bridge_1:m0_write -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_write
	wire   [4:0] mm_clock_crossing_bridge_1_m0_burstcount;                 // mm_clock_crossing_bridge_1:m0_burstcount -> mm_interconnect_0:mm_clock_crossing_bridge_1_m0_burstcount
	wire         mm_clock_crossing_bridge_0_m0_waitrequest;                // mm_interconnect_0:mm_clock_crossing_bridge_0_m0_waitrequest -> mm_clock_crossing_bridge_0:m0_waitrequest
	wire  [63:0] mm_clock_crossing_bridge_0_m0_readdata;                   // mm_interconnect_0:mm_clock_crossing_bridge_0_m0_readdata -> mm_clock_crossing_bridge_0:m0_readdata
	wire         mm_clock_crossing_bridge_0_m0_debugaccess;                // mm_clock_crossing_bridge_0:m0_debugaccess -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_debugaccess
	wire  [28:0] mm_clock_crossing_bridge_0_m0_address;                    // mm_clock_crossing_bridge_0:m0_address -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_address
	wire         mm_clock_crossing_bridge_0_m0_read;                       // mm_clock_crossing_bridge_0:m0_read -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_read
	wire   [7:0] mm_clock_crossing_bridge_0_m0_byteenable;                 // mm_clock_crossing_bridge_0:m0_byteenable -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_byteenable
	wire         mm_clock_crossing_bridge_0_m0_readdatavalid;              // mm_interconnect_0:mm_clock_crossing_bridge_0_m0_readdatavalid -> mm_clock_crossing_bridge_0:m0_readdatavalid
	wire  [63:0] mm_clock_crossing_bridge_0_m0_writedata;                  // mm_clock_crossing_bridge_0:m0_writedata -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_writedata
	wire         mm_clock_crossing_bridge_0_m0_write;                      // mm_clock_crossing_bridge_0:m0_write -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_write
	wire   [4:0] mm_clock_crossing_bridge_0_m0_burstcount;                 // mm_clock_crossing_bridge_0:m0_burstcount -> mm_interconnect_0:mm_clock_crossing_bridge_0_m0_burstcount
	wire         mm_interconnect_0_ddr3_controller_avl_beginbursttransfer; // mm_interconnect_0:ddr3_controller_avl_beginbursttransfer -> ddr3_controller:avl_burstbegin
	wire  [63:0] mm_interconnect_0_ddr3_controller_avl_readdata;           // ddr3_controller:avl_rdata -> mm_interconnect_0:ddr3_controller_avl_readdata
	wire         mm_interconnect_0_ddr3_controller_avl_waitrequest;        // ddr3_controller:avl_ready -> mm_interconnect_0:ddr3_controller_avl_waitrequest
	wire  [25:0] mm_interconnect_0_ddr3_controller_avl_address;            // mm_interconnect_0:ddr3_controller_avl_address -> ddr3_controller:avl_addr
	wire         mm_interconnect_0_ddr3_controller_avl_read;               // mm_interconnect_0:ddr3_controller_avl_read -> ddr3_controller:avl_read_req
	wire   [7:0] mm_interconnect_0_ddr3_controller_avl_byteenable;         // mm_interconnect_0:ddr3_controller_avl_byteenable -> ddr3_controller:avl_be
	wire         mm_interconnect_0_ddr3_controller_avl_readdatavalid;      // ddr3_controller:avl_rdata_valid -> mm_interconnect_0:ddr3_controller_avl_readdatavalid
	wire         mm_interconnect_0_ddr3_controller_avl_write;              // mm_interconnect_0:ddr3_controller_avl_write -> ddr3_controller:avl_write_req
	wire  [63:0] mm_interconnect_0_ddr3_controller_avl_writedata;          // mm_interconnect_0:ddr3_controller_avl_writedata -> ddr3_controller:avl_wdata
	wire   [2:0] mm_interconnect_0_ddr3_controller_avl_burstcount;         // mm_interconnect_0:ddr3_controller_avl_burstcount -> ddr3_controller:avl_size
	wire         rst_controller_reset_out_reset;                           // rst_controller:reset_out -> [mm_clock_crossing_bridge_0:m0_reset, mm_clock_crossing_bridge_1:m0_reset, mm_interconnect_0:mm_clock_crossing_bridge_1_m0_reset_reset_bridge_in_reset_reset]
	wire         rst_controller_001_reset_out_reset;                       // rst_controller_001:reset_out -> [mm_interconnect_0:ddr3_controller_avl_translator_reset_reset_bridge_in_reset_reset, mm_interconnect_0:ddr3_controller_soft_reset_reset_bridge_in_reset_reset]

	ddr3_qsys_ddr3_controller ddr3_controller (
		.pll_ref_clk        (mem_clk_clk),                                              //      pll_ref_clk.clk
		.global_reset_n     (mem_reset_reset_n),                                        //     global_reset.reset_n
		.soft_reset_n       (mem_reset_reset_n),                                        //       soft_reset.reset_n
		.afi_clk            (ddr3_controller_afi_clk_clk),                              //          afi_clk.clk
		.afi_half_clk       (),                                                         //     afi_half_clk.clk
		.afi_reset_n        (),                                                         //        afi_reset.reset_n
		.afi_reset_export_n (),                                                         // afi_reset_export.reset_n
		.mem_a              (memory_mem_a),                                             //           memory.mem_a
		.mem_ba             (memory_mem_ba),                                            //                 .mem_ba
		.mem_ck             (memory_mem_ck),                                            //                 .mem_ck
		.mem_ck_n           (memory_mem_ck_n),                                          //                 .mem_ck_n
		.mem_cke            (memory_mem_cke),                                           //                 .mem_cke
		.mem_cs_n           (memory_mem_cs_n),                                          //                 .mem_cs_n
		.mem_dm             (memory_mem_dm),                                            //                 .mem_dm
		.mem_ras_n          (memory_mem_ras_n),                                         //                 .mem_ras_n
		.mem_cas_n          (memory_mem_cas_n),                                         //                 .mem_cas_n
		.mem_we_n           (memory_mem_we_n),                                          //                 .mem_we_n
		.mem_reset_n        (memory_mem_reset_n),                                       //                 .mem_reset_n
		.mem_dq             (memory_mem_dq),                                            //                 .mem_dq
		.mem_dqs            (memory_mem_dqs),                                           //                 .mem_dqs
		.mem_dqs_n          (memory_mem_dqs_n),                                         //                 .mem_dqs_n
		.mem_odt            (memory_mem_odt),                                           //                 .mem_odt
		.avl_ready          (mm_interconnect_0_ddr3_controller_avl_waitrequest),        //              avl.waitrequest_n
		.avl_burstbegin     (mm_interconnect_0_ddr3_controller_avl_beginbursttransfer), //                 .beginbursttransfer
		.avl_addr           (mm_interconnect_0_ddr3_controller_avl_address),            //                 .address
		.avl_rdata_valid    (mm_interconnect_0_ddr3_controller_avl_readdatavalid),      //                 .readdatavalid
		.avl_rdata          (mm_interconnect_0_ddr3_controller_avl_readdata),           //                 .readdata
		.avl_wdata          (mm_interconnect_0_ddr3_controller_avl_writedata),          //                 .writedata
		.avl_be             (mm_interconnect_0_ddr3_controller_avl_byteenable),         //                 .byteenable
		.avl_read_req       (mm_interconnect_0_ddr3_controller_avl_read),               //                 .read
		.avl_write_req      (mm_interconnect_0_ddr3_controller_avl_write),              //                 .write
		.avl_size           (mm_interconnect_0_ddr3_controller_avl_burstcount),         //                 .burstcount
		.local_init_done    (mem_status_local_init_done),                               //           status.local_init_done
		.local_cal_success  (mem_status_local_cal_success),                             //                 .local_cal_success
		.local_cal_fail     (mem_status_local_cal_fail),                                //                 .local_cal_fail
		.pll_mem_clk        (),                                                         //      pll_sharing.pll_mem_clk
		.pll_write_clk      (),                                                         //                 .pll_write_clk
		.pll_locked         (),                                                         //                 .pll_locked
		.pll_capture0_clk   (),                                                         //                 .pll_capture0_clk
		.pll_capture1_clk   ()                                                          //                 .pll_capture1_clk
	);

	altera_avalon_mm_clock_crossing_bridge #(
		.DATA_WIDTH          (64),
		.SYMBOL_WIDTH        (8),
		.HDL_ADDR_WIDTH      (29),
		.BURSTCOUNT_WIDTH    (5),
		.COMMAND_FIFO_DEPTH  (4),
		.RESPONSE_FIFO_DEPTH (32),
		.MASTER_SYNC_DEPTH   (2),
		.SLAVE_SYNC_DEPTH    (2)
	) mm_clock_crossing_bridge_0 (
		.m0_clk           (ddr3_controller_afi_clk_clk),                 //   m0_clk.clk
		.m0_reset         (rst_controller_reset_out_reset),              // m0_reset.reset
		.s0_clk           (clk_clk),                                     //   s0_clk.clk
		.s0_reset         (~reset_reset_n),                              // s0_reset.reset
		.s0_waitrequest   (avl_ddr0_waitrequest),                        //       s0.waitrequest
		.s0_readdata      (avl_ddr0_readdata),                           //         .readdata
		.s0_readdatavalid (avl_ddr0_readdatavalid),                      //         .readdatavalid
		.s0_burstcount    (avl_ddr0_burstcount),                         //         .burstcount
		.s0_writedata     (avl_ddr0_writedata),                          //         .writedata
		.s0_address       (avl_ddr0_address),                            //         .address
		.s0_write         (avl_ddr0_write),                              //         .write
		.s0_read          (avl_ddr0_read),                               //         .read
		.s0_byteenable    (avl_ddr0_byteenable),                         //         .byteenable
		.s0_debugaccess   (avl_ddr0_debugaccess),                        //         .debugaccess
		.m0_waitrequest   (mm_clock_crossing_bridge_0_m0_waitrequest),   //       m0.waitrequest
		.m0_readdata      (mm_clock_crossing_bridge_0_m0_readdata),      //         .readdata
		.m0_readdatavalid (mm_clock_crossing_bridge_0_m0_readdatavalid), //         .readdatavalid
		.m0_burstcount    (mm_clock_crossing_bridge_0_m0_burstcount),    //         .burstcount
		.m0_writedata     (mm_clock_crossing_bridge_0_m0_writedata),     //         .writedata
		.m0_address       (mm_clock_crossing_bridge_0_m0_address),       //         .address
		.m0_write         (mm_clock_crossing_bridge_0_m0_write),         //         .write
		.m0_read          (mm_clock_crossing_bridge_0_m0_read),          //         .read
		.m0_byteenable    (mm_clock_crossing_bridge_0_m0_byteenable),    //         .byteenable
		.m0_debugaccess   (mm_clock_crossing_bridge_0_m0_debugaccess)    //         .debugaccess
	);

	altera_avalon_mm_clock_crossing_bridge #(
		.DATA_WIDTH          (64),
		.SYMBOL_WIDTH        (8),
		.HDL_ADDR_WIDTH      (29),
		.BURSTCOUNT_WIDTH    (5),
		.COMMAND_FIFO_DEPTH  (4),
		.RESPONSE_FIFO_DEPTH (32),
		.MASTER_SYNC_DEPTH   (2),
		.SLAVE_SYNC_DEPTH    (2)
	) mm_clock_crossing_bridge_1 (
		.m0_clk           (ddr3_controller_afi_clk_clk),                 //   m0_clk.clk
		.m0_reset         (rst_controller_reset_out_reset),              // m0_reset.reset
		.s0_clk           (clk_clk),                                     //   s0_clk.clk
		.s0_reset         (~reset_reset_n),                              // s0_reset.reset
		.s0_waitrequest   (avl_ddr1_waitrequest),                        //       s0.waitrequest
		.s0_readdata      (avl_ddr1_readdata),                           //         .readdata
		.s0_readdatavalid (avl_ddr1_readdatavalid),                      //         .readdatavalid
		.s0_burstcount    (avl_ddr1_burstcount),                         //         .burstcount
		.s0_writedata     (avl_ddr1_writedata),                          //         .writedata
		.s0_address       (avl_ddr1_address),                            //         .address
		.s0_write         (avl_ddr1_write),                              //         .write
		.s0_read          (avl_ddr1_read),                               //         .read
		.s0_byteenable    (avl_ddr1_byteenable),                         //         .byteenable
		.s0_debugaccess   (avl_ddr1_debugaccess),                        //         .debugaccess
		.m0_waitrequest   (mm_clock_crossing_bridge_1_m0_waitrequest),   //       m0.waitrequest
		.m0_readdata      (mm_clock_crossing_bridge_1_m0_readdata),      //         .readdata
		.m0_readdatavalid (mm_clock_crossing_bridge_1_m0_readdatavalid), //         .readdatavalid
		.m0_burstcount    (mm_clock_crossing_bridge_1_m0_burstcount),    //         .burstcount
		.m0_writedata     (mm_clock_crossing_bridge_1_m0_writedata),     //         .writedata
		.m0_address       (mm_clock_crossing_bridge_1_m0_address),       //         .address
		.m0_write         (mm_clock_crossing_bridge_1_m0_write),         //         .write
		.m0_read          (mm_clock_crossing_bridge_1_m0_read),          //         .read
		.m0_byteenable    (mm_clock_crossing_bridge_1_m0_byteenable),    //         .byteenable
		.m0_debugaccess   (mm_clock_crossing_bridge_1_m0_debugaccess)    //         .debugaccess
	);

	ddr3_qsys_mm_interconnect_0 mm_interconnect_0 (
		.ddr3_controller_afi_clk_clk                                      (ddr3_controller_afi_clk_clk),                              //                                    ddr3_controller_afi_clk.clk
		.ddr3_controller_avl_translator_reset_reset_bridge_in_reset_reset (rst_controller_001_reset_out_reset),                       // ddr3_controller_avl_translator_reset_reset_bridge_in_reset.reset
		.ddr3_controller_soft_reset_reset_bridge_in_reset_reset           (rst_controller_001_reset_out_reset),                       //           ddr3_controller_soft_reset_reset_bridge_in_reset.reset
		.mm_clock_crossing_bridge_1_m0_reset_reset_bridge_in_reset_reset  (rst_controller_reset_out_reset),                           //  mm_clock_crossing_bridge_1_m0_reset_reset_bridge_in_reset.reset
		.mm_clock_crossing_bridge_0_m0_address                            (mm_clock_crossing_bridge_0_m0_address),                    //                              mm_clock_crossing_bridge_0_m0.address
		.mm_clock_crossing_bridge_0_m0_waitrequest                        (mm_clock_crossing_bridge_0_m0_waitrequest),                //                                                           .waitrequest
		.mm_clock_crossing_bridge_0_m0_burstcount                         (mm_clock_crossing_bridge_0_m0_burstcount),                 //                                                           .burstcount
		.mm_clock_crossing_bridge_0_m0_byteenable                         (mm_clock_crossing_bridge_0_m0_byteenable),                 //                                                           .byteenable
		.mm_clock_crossing_bridge_0_m0_read                               (mm_clock_crossing_bridge_0_m0_read),                       //                                                           .read
		.mm_clock_crossing_bridge_0_m0_readdata                           (mm_clock_crossing_bridge_0_m0_readdata),                   //                                                           .readdata
		.mm_clock_crossing_bridge_0_m0_readdatavalid                      (mm_clock_crossing_bridge_0_m0_readdatavalid),              //                                                           .readdatavalid
		.mm_clock_crossing_bridge_0_m0_write                              (mm_clock_crossing_bridge_0_m0_write),                      //                                                           .write
		.mm_clock_crossing_bridge_0_m0_writedata                          (mm_clock_crossing_bridge_0_m0_writedata),                  //                                                           .writedata
		.mm_clock_crossing_bridge_0_m0_debugaccess                        (mm_clock_crossing_bridge_0_m0_debugaccess),                //                                                           .debugaccess
		.mm_clock_crossing_bridge_1_m0_address                            (mm_clock_crossing_bridge_1_m0_address),                    //                              mm_clock_crossing_bridge_1_m0.address
		.mm_clock_crossing_bridge_1_m0_waitrequest                        (mm_clock_crossing_bridge_1_m0_waitrequest),                //                                                           .waitrequest
		.mm_clock_crossing_bridge_1_m0_burstcount                         (mm_clock_crossing_bridge_1_m0_burstcount),                 //                                                           .burstcount
		.mm_clock_crossing_bridge_1_m0_byteenable                         (mm_clock_crossing_bridge_1_m0_byteenable),                 //                                                           .byteenable
		.mm_clock_crossing_bridge_1_m0_read                               (mm_clock_crossing_bridge_1_m0_read),                       //                                                           .read
		.mm_clock_crossing_bridge_1_m0_readdata                           (mm_clock_crossing_bridge_1_m0_readdata),                   //                                                           .readdata
		.mm_clock_crossing_bridge_1_m0_readdatavalid                      (mm_clock_crossing_bridge_1_m0_readdatavalid),              //                                                           .readdatavalid
		.mm_clock_crossing_bridge_1_m0_write                              (mm_clock_crossing_bridge_1_m0_write),                      //                                                           .write
		.mm_clock_crossing_bridge_1_m0_writedata                          (mm_clock_crossing_bridge_1_m0_writedata),                  //                                                           .writedata
		.mm_clock_crossing_bridge_1_m0_debugaccess                        (mm_clock_crossing_bridge_1_m0_debugaccess),                //                                                           .debugaccess
		.ddr3_controller_avl_address                                      (mm_interconnect_0_ddr3_controller_avl_address),            //                                        ddr3_controller_avl.address
		.ddr3_controller_avl_write                                        (mm_interconnect_0_ddr3_controller_avl_write),              //                                                           .write
		.ddr3_controller_avl_read                                         (mm_interconnect_0_ddr3_controller_avl_read),               //                                                           .read
		.ddr3_controller_avl_readdata                                     (mm_interconnect_0_ddr3_controller_avl_readdata),           //                                                           .readdata
		.ddr3_controller_avl_writedata                                    (mm_interconnect_0_ddr3_controller_avl_writedata),          //                                                           .writedata
		.ddr3_controller_avl_beginbursttransfer                           (mm_interconnect_0_ddr3_controller_avl_beginbursttransfer), //                                                           .beginbursttransfer
		.ddr3_controller_avl_burstcount                                   (mm_interconnect_0_ddr3_controller_avl_burstcount),         //                                                           .burstcount
		.ddr3_controller_avl_byteenable                                   (mm_interconnect_0_ddr3_controller_avl_byteenable),         //                                                           .byteenable
		.ddr3_controller_avl_readdatavalid                                (mm_interconnect_0_ddr3_controller_avl_readdatavalid),      //                                                           .readdatavalid
		.ddr3_controller_avl_waitrequest                                  (~mm_interconnect_0_ddr3_controller_avl_waitrequest)        //                                                           .waitrequest
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (ddr3_controller_afi_clk_clk),    //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~mem_reset_reset_n),                 // reset_in0.reset
		.clk            (ddr3_controller_afi_clk_clk),        //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule