###############################################################################
# Copyright (C) 1991-2026 Altera Corporation. All rights reserved.
# Any  megafunction  design,  and related netlist (encrypted  or  decrypted),
# support information,  device programming or simulation file,  and any other
# associated  documentation or information  provided by  Intel  or a partner
# under  Intel's   Megafunction   Partnership   Program  may  be  used  only
# to program  PLD  devices (but not masked  PLD  devices) from  Intel.   Any
# other  use  of such  megafunction  design,  netlist,  support  information,
# device programming or simulation file,  or any other  related documentation
# or information  is prohibited  for  any  other purpose,  including, but not
# limited to  modification,  reverse engineering,  de-compiling, or use  with
# any other  silicon devices,  unless such use is  explicitly  licensed under
# a separate agreement with  Intel  or a megafunction partner.  Title to the
# intellectual property,  including patents,  copyrights,  trademarks,  trade
# secrets,  or maskworks,  embodied in any such megafunction design, netlist,
# support  information,  device programming or simulation file,  or any other
# related documentation or information provided by  Intel  or a megafunction
# partner, remains with Intel, the megafunction partner, or their respective
# licensors. No other licenses, including any licenses needed under any third
# party's intellectual property, are provided herein.
#
###############################################################################


# FPGA Xchange file generated using Quartus Prime Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition

# DESIGN=UARTGraphics
# REVISION=UARTGraphics
# DEVICE=5CSEMA5
# PACKAGE=FBGA
# SPEEDGRADE=6

Signal Name,Pin Number,Direction,IO Standard,Drive (mA),Termination,Slew Rate,Swap Group,Diff Type

hs,B11,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vs,D11,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[0],A13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[1],C13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[2],E13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[3],B12,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[4],C12,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[5],D12,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[6],E12,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_red[7],F13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[0],J9,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[1],J10,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[2],H12,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[3],G10,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[4],G11,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[5],G12,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[6],F11,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_green[7],E11,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[0],B13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[1],G13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[2],H13,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[3],F14,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[4],H14,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[5],F15,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[6],G15,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blue[7],J14,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
hs_led,W21,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vs_led,Y21,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
rgb[0],W19,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
rgb[1],W17,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
rgb[2],V18,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_clock,A11,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_blank_n,F10,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
vga_sync_n,C10,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
uart_txd,Y17,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_0,--
clk_50mhz,AF14,input,2.5 V,,Off,--,swap_1,--
clear,AA16,input,2.5 V,,Off,--,swap_1,--
en,AE12,input,2.5 V,,Off,--,swap_1,--
uart_rxd,AC18,input,2.5 V,,Off,--,swap_1,--
