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

sw_1,AC12,input,2.5 V,,Off,--,swap_0,--
uart_txd,Y17,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[0],V16,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[1],W16,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[2],V17,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[3],V18,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[4],W17,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[5],W19,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[6],Y19,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
led[7],W20,output,2.5 V,Default,Series 50 Ohm without Calibration,FAST,swap_1,--
clk,AF14,input,2.5 V,,Off,--,swap_0,--
sw_0,AB12,input,2.5 V,,Off,--,swap_0,--
uart_rxd,AC18,input,2.5 V,,Off,--,swap_0,--
