/*****************************************************************************\
|                        Copyright (C) 2023 Luke Wren                         |
|                     SPDX-License-Identifier: Apache-2.0                     |
\*****************************************************************************/

`default_nettype none

module fpga_ulx3s (
	input  wire       clk_osc,

	input  wire       swclk,
	inout  wire       swdio,

	output wire       uart_tx,
	input  wire       uart_rx
);

wire clk_sys;
wire pll_sys_locked;
wire rst_n_sys;

pll_25_50 pll_sys (
	.clkin   (clk_osc),
	.clkout0 (clk_sys),
	.locked  (pll_sys_locked)
);

fpga_reset #(
	.SHIFT (3)
) rstgen (
	.clk         (clk_sys),
	.force_rst_n (pll_sys_locked),
	.rst_n       (rst_n_sys)
);

wire swclk;
wire swdi;
wire swdo;
wire swdo_en;

example_soc #(
	.SRAM_DEPTH         (1 << 15),
	.CLK_MHZ            (50)
) soc_u (
	.clk     (clk_sys),
	.rst_n   (rst_n_sys),

	.swclk   (swclk),
	.swdi    (swdi),
	.swdo    (swdo),
	.swdo_en (swdo_en),

	.uart_tx (uart_tx),
	.uart_rx (uart_rx)
);

// TODO There is supposed to be a pullup on SWDIO, though things should work
// without it

assign swdio = swdo_en ? swdo : 1'bz;
assign swdi = swdio;

endmodule
