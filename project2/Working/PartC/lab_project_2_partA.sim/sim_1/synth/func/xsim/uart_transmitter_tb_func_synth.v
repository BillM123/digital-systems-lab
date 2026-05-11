// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Wed Oct 30 17:07:52 2024
// Host        : master0 running 64-bit unknown
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/billm123/digsys-project-2/Working/lab_project_2_partA.sim/sim_1/synth/func/xsim/uart_transmitter_tb_func_synth.v
// Design      : uart_transmitter
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module baud_controller
   (E,
    CLK,
    AR,
    Tx_EN_IBUF,
    baud_select_IBUF);
  output [0:0]E;
  input CLK;
  input [0:0]AR;
  input Tx_EN_IBUF;
  input [2:0]baud_select_IBUF;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire Tx_EN_IBUF;
  wire [2:0]baud_select_IBUF;
  wire [14:0]counter;
  wire [14:1]counter0;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__2_n_3;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire counter1_carry__0_i_1_n_0;
  wire counter1_carry__0_n_3;
  wire counter1_carry_i_1_n_0;
  wire counter1_carry_i_2_n_0;
  wire counter1_carry_i_3_n_0;
  wire counter1_carry_i_4_n_0;
  wire counter1_carry_n_0;
  wire counter1_carry_n_1;
  wire counter1_carry_n_2;
  wire counter1_carry_n_3;
  wire [14:0]p_0_in;
  wire sample_ENABLE_i_1_n_0;
  wire [3:1]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_counter0_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_counter1_carry_O_UNCONNECTED;
  wire [3:1]NLW_counter1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_counter1_carry__0_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[4:1]),
        .S(counter[4:1]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[8:5]),
        .S(counter[8:5]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[12:9]),
        .S(counter[12:9]));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({NLW_counter0_carry__2_CO_UNCONNECTED[3:1],counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__2_O_UNCONNECTED[3:2],counter0[14:13]}),
        .S({1'b0,1'b0,counter[14:13]}));
  CARRY4 counter1_carry
       (.CI(1'b0),
        .CO({counter1_carry_n_0,counter1_carry_n_1,counter1_carry_n_2,counter1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_counter1_carry_O_UNCONNECTED[3:0]),
        .S({counter1_carry_i_1_n_0,counter1_carry_i_2_n_0,counter1_carry_i_3_n_0,counter1_carry_i_4_n_0}));
  CARRY4 counter1_carry__0
       (.CI(counter1_carry_n_0),
        .CO({NLW_counter1_carry__0_CO_UNCONNECTED[3:1],counter1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_counter1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,counter1_carry__0_i_1_n_0}));
  LUT6 #(
    .INIT(64'h0000000211111210)) 
    counter1_carry__0_i_1
       (.I0(counter[12]),
        .I1(counter[13]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[0]),
        .I4(baud_select_IBUF[2]),
        .I5(counter[14]),
        .O(counter1_carry__0_i_1_n_0));
  LUT6 #(
    .INIT(64'h0001010012101011)) 
    counter1_carry_i_1
       (.I0(counter[9]),
        .I1(counter[11]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[0]),
        .I4(baud_select_IBUF[1]),
        .I5(counter[10]),
        .O(counter1_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000044001226008)) 
    counter1_carry_i_2
       (.I0(counter[6]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[1]),
        .I4(counter[8]),
        .I5(counter[7]),
        .O(counter1_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h4000021004812004)) 
    counter1_carry_i_3
       (.I0(counter[3]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[0]),
        .I4(counter[5]),
        .I5(counter[4]),
        .O(counter1_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h4120088020000006)) 
    counter1_carry_i_4
       (.I0(counter[0]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[2]),
        .I4(counter[2]),
        .I5(counter[1]),
        .O(counter1_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \counter[0]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[10]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[10]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[11]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[11]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[12]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[12]),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[13]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[13]),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[14]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[14]),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[1]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[2]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[3]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[4]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[4]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[5]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[6]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[7]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[7]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[8]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[9]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[9]),
        .O(p_0_in[9]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[0]),
        .Q(counter[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[10]),
        .Q(counter[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[11]),
        .Q(counter[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[12]),
        .Q(counter[12]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[13]),
        .Q(counter[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[14]),
        .Q(counter[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[1]),
        .Q(counter[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[2]),
        .Q(counter[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[3]),
        .Q(counter[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[4]),
        .Q(counter[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[5]),
        .Q(counter[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[6]),
        .Q(counter[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[7]),
        .Q(counter[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[8]),
        .Q(counter[8]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(p_0_in[9]),
        .Q(counter[9]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sample_ENABLE_i_1
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .O(sample_ENABLE_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sample_ENABLE_reg
       (.C(CLK),
        .CE(1'b1),
        .CLR(AR),
        .D(sample_ENABLE_i_1_n_0),
        .Q(E));
endmodule

(* NotValidForBitStream *)
module uart_transmitter
   (reset,
    clk,
    Tx_DATA,
    baud_select,
    Tx_WR,
    Tx_EN,
    TxD,
    Tx_BUSY);
  input reset;
  input clk;
  input [7:0]Tx_DATA;
  input [2:0]baud_select;
  input Tx_WR;
  input Tx_EN;
  output TxD;
  output Tx_BUSY;

  wire \FSM_sequential_state[0]_i_1_n_0 ;
  wire \FSM_sequential_state[1]_i_1_n_0 ;
  wire \FSM_sequential_state[2]_i_1_n_0 ;
  wire TxD;
  wire TxD_OBUF;
  wire TxD_i_1_n_0;
  wire TxD_i_2_n_0;
  wire TxD_i_3_n_0;
  wire TxD_i_4_n_0;
  wire Tx_BUSY;
  wire Tx_BUSY_OBUF;
  wire Tx_BUSY_i_1_n_0;
  wire Tx_BUSY_i_2_n_0;
  wire [7:0]Tx_DATA;
  wire [7:0]Tx_DATA_IBUF;
  wire Tx_EN;
  wire Tx_EN_IBUF;
  wire Tx_WR;
  wire Tx_WR_IBUF;
  wire [2:0]baud_select;
  wire [2:0]baud_select_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \enableCounter[2]_i_1_n_0 ;
  wire [3:0]enableCounter_reg;
  wire [3:0]p_0_in__0;
  wire reset;
  wire reset_IBUF;
  wire sample_ENABLE;
  wire state;
  wire [2:0]state__0;
  wire writePointer;
  wire \writePointer[0]_i_1_n_0 ;
  wire \writePointer[1]_i_1_n_0 ;
  wire \writePointer[2]_i_1_n_0 ;
  wire [2:0]writePointer__0;

  LUT6 #(
    .INIT(64'hF0F00F08FFFF0008)) 
    \FSM_sequential_state[0]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(Tx_WR_IBUF),
        .I2(state__0[2]),
        .I3(state__0[1]),
        .I4(state__0[0]),
        .I5(state),
        .O(\FSM_sequential_state[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h9CCC)) 
    \FSM_sequential_state[1]_i_1 
       (.I0(state__0[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(state),
        .O(\FSM_sequential_state[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hE8AA)) 
    \FSM_sequential_state[2]_i_1 
       (.I0(state__0[2]),
        .I1(state__0[1]),
        .I2(state__0[0]),
        .I3(state),
        .O(\FSM_sequential_state[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \FSM_sequential_state[2]_i_2 
       (.I0(enableCounter_reg[2]),
        .I1(enableCounter_reg[3]),
        .I2(enableCounter_reg[0]),
        .I3(enableCounter_reg[1]),
        .O(state));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_sequential_state[0]_i_1_n_0 ),
        .Q(state__0[0]));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_sequential_state[1]_i_1_n_0 ),
        .Q(state__0[1]));
  (* FSM_ENCODED_STATES = "iSTATE:000,iSTATE0:001,iSTATE1:010,iSTATE2:011,iSTATE3:100," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_sequential_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_sequential_state[2]_i_1_n_0 ),
        .Q(state__0[2]));
  OBUF TxD_OBUF_inst
       (.I(TxD_OBUF),
        .O(TxD));
  LUT3 #(
    .INIT(8'h1E)) 
    TxD_i_1
       (.I0(state__0[0]),
        .I1(state__0[1]),
        .I2(state__0[2]),
        .O(TxD_i_1_n_0));
  LUT6 #(
    .INIT(64'h000055555555DFD5)) 
    TxD_i_2
       (.I0(state__0[1]),
        .I1(TxD_i_3_n_0),
        .I2(writePointer__0[2]),
        .I3(TxD_i_4_n_0),
        .I4(state__0[2]),
        .I5(state__0[0]),
        .O(TxD_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    TxD_i_3
       (.I0(Tx_DATA_IBUF[7]),
        .I1(Tx_DATA_IBUF[6]),
        .I2(writePointer__0[1]),
        .I3(Tx_DATA_IBUF[5]),
        .I4(writePointer__0[0]),
        .I5(Tx_DATA_IBUF[4]),
        .O(TxD_i_3_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    TxD_i_4
       (.I0(Tx_DATA_IBUF[3]),
        .I1(Tx_DATA_IBUF[2]),
        .I2(writePointer__0[1]),
        .I3(Tx_DATA_IBUF[1]),
        .I4(writePointer__0[0]),
        .I5(Tx_DATA_IBUF[0]),
        .O(TxD_i_4_n_0));
  FDCE #(
    .INIT(1'b0)) 
    TxD_reg
       (.C(clk_IBUF_BUFG),
        .CE(TxD_i_1_n_0),
        .CLR(reset_IBUF),
        .D(TxD_i_2_n_0),
        .Q(TxD_OBUF));
  OBUF Tx_BUSY_OBUF_inst
       (.I(Tx_BUSY_OBUF),
        .O(Tx_BUSY));
  LUT3 #(
    .INIT(8'h01)) 
    Tx_BUSY_i_1
       (.I0(state__0[1]),
        .I1(state__0[0]),
        .I2(state__0[2]),
        .O(Tx_BUSY_i_1_n_0));
  LUT2 #(
    .INIT(4'h8)) 
    Tx_BUSY_i_2
       (.I0(Tx_EN_IBUF),
        .I1(Tx_WR_IBUF),
        .O(Tx_BUSY_i_2_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Tx_BUSY_reg
       (.C(clk_IBUF_BUFG),
        .CE(Tx_BUSY_i_1_n_0),
        .CLR(reset_IBUF),
        .D(Tx_BUSY_i_2_n_0),
        .Q(Tx_BUSY_OBUF));
  IBUF \Tx_DATA_IBUF[0]_inst 
       (.I(Tx_DATA[0]),
        .O(Tx_DATA_IBUF[0]));
  IBUF \Tx_DATA_IBUF[1]_inst 
       (.I(Tx_DATA[1]),
        .O(Tx_DATA_IBUF[1]));
  IBUF \Tx_DATA_IBUF[2]_inst 
       (.I(Tx_DATA[2]),
        .O(Tx_DATA_IBUF[2]));
  IBUF \Tx_DATA_IBUF[3]_inst 
       (.I(Tx_DATA[3]),
        .O(Tx_DATA_IBUF[3]));
  IBUF \Tx_DATA_IBUF[4]_inst 
       (.I(Tx_DATA[4]),
        .O(Tx_DATA_IBUF[4]));
  IBUF \Tx_DATA_IBUF[5]_inst 
       (.I(Tx_DATA[5]),
        .O(Tx_DATA_IBUF[5]));
  IBUF \Tx_DATA_IBUF[6]_inst 
       (.I(Tx_DATA[6]),
        .O(Tx_DATA_IBUF[6]));
  IBUF \Tx_DATA_IBUF[7]_inst 
       (.I(Tx_DATA[7]),
        .O(Tx_DATA_IBUF[7]));
  IBUF Tx_EN_IBUF_inst
       (.I(Tx_EN),
        .O(Tx_EN_IBUF));
  IBUF Tx_WR_IBUF_inst
       (.I(Tx_WR),
        .O(Tx_WR_IBUF));
  baud_controller baud_controller_tx_inst
       (.AR(reset_IBUF),
        .CLK(clk_IBUF_BUFG),
        .E(sample_ENABLE),
        .Tx_EN_IBUF(Tx_EN_IBUF),
        .baud_select_IBUF(baud_select_IBUF));
  IBUF \baud_select_IBUF[0]_inst 
       (.I(baud_select[0]),
        .O(baud_select_IBUF[0]));
  IBUF \baud_select_IBUF[1]_inst 
       (.I(baud_select[1]),
        .O(baud_select_IBUF[1]));
  IBUF \baud_select_IBUF[2]_inst 
       (.I(baud_select[2]),
        .O(baud_select_IBUF[2]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    \enableCounter[0]_i_1 
       (.I0(enableCounter_reg[0]),
        .O(p_0_in__0[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \enableCounter[1]_i_1 
       (.I0(enableCounter_reg[0]),
        .I1(enableCounter_reg[1]),
        .O(p_0_in__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \enableCounter[2]_i_1 
       (.I0(enableCounter_reg[1]),
        .I1(enableCounter_reg[0]),
        .I2(enableCounter_reg[2]),
        .O(\enableCounter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \enableCounter[3]_i_1 
       (.I0(enableCounter_reg[0]),
        .I1(enableCounter_reg[1]),
        .I2(enableCounter_reg[2]),
        .I3(enableCounter_reg[3]),
        .O(p_0_in__0[3]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(sample_ENABLE),
        .CLR(reset_IBUF),
        .D(p_0_in__0[0]),
        .Q(enableCounter_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(sample_ENABLE),
        .CLR(reset_IBUF),
        .D(p_0_in__0[1]),
        .Q(enableCounter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(sample_ENABLE),
        .CLR(reset_IBUF),
        .D(\enableCounter[2]_i_1_n_0 ),
        .Q(enableCounter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(sample_ENABLE),
        .CLR(reset_IBUF),
        .D(p_0_in__0[3]),
        .Q(enableCounter_reg[3]));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'hFFF70008)) 
    \writePointer[0]_i_1 
       (.I0(state),
        .I1(state__0[1]),
        .I2(state__0[2]),
        .I3(state__0[0]),
        .I4(writePointer__0[0]),
        .O(\writePointer[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFDFFFFFF02000000)) 
    \writePointer[1]_i_1 
       (.I0(writePointer__0[0]),
        .I1(state__0[0]),
        .I2(state__0[2]),
        .I3(state__0[1]),
        .I4(state),
        .I5(writePointer__0[1]),
        .O(\writePointer[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h7F80)) 
    \writePointer[2]_i_1 
       (.I0(writePointer__0[0]),
        .I1(writePointer__0[1]),
        .I2(writePointer),
        .I3(writePointer__0[2]),
        .O(\writePointer[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    \writePointer[2]_i_2 
       (.I0(state__0[0]),
        .I1(state__0[2]),
        .I2(state__0[1]),
        .I3(state),
        .O(writePointer));
  FDCE #(
    .INIT(1'b0)) 
    \writePointer_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writePointer[0]_i_1_n_0 ),
        .Q(writePointer__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \writePointer_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writePointer[1]_i_1_n_0 ),
        .Q(writePointer__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \writePointer_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writePointer[2]_i_1_n_0 ),
        .Q(writePointer__0[2]));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
