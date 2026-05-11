// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Mon Nov 11 20:43:07 2024
// Host        : master0 running 64-bit unknown
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/bill/projects/project2/PartD/lab_project_2_partA.sim/sim_1/synth/func/xsim/uart_channel_tb_func_synth.v
// Design      : uart_channel
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module baud_controller
   (E,
    switchEnable0,
    clk_IBUF_BUFG,
    reset_IBUF,
    Tx_EN_IBUF,
    Q,
    baud_select_IBUF,
    switchEnable_reg);
  output [0:0]E;
  output switchEnable0;
  input clk_IBUF_BUFG;
  input reset_IBUF;
  input Tx_EN_IBUF;
  input [0:0]Q;
  input [2:0]baud_select_IBUF;
  input [3:0]switchEnable_reg;

  wire [0:0]E;
  wire [0:0]Q;
  wire Tx_EN_IBUF;
  wire Tx_sample_ENABLE;
  wire [2:0]baud_select_IBUF;
  wire clk_IBUF_BUFG;
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
  wire reset_IBUF;
  wire sample_ENABLE_i_1_n_0;
  wire switchEnable0;
  wire [3:0]switchEnable_reg;
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
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \counter[0]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[10]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[10]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[11]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[11]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[12]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[12]),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[13]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[13]),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[14]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[14]),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[1]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[2]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[3]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[4]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[4]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[5]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[6]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[7]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[7]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[8]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair23" *) 
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
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[0]),
        .Q(counter[0]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[10]),
        .Q(counter[10]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[11]),
        .Q(counter[11]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[12]),
        .Q(counter[12]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[13]),
        .Q(counter[13]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[14]),
        .Q(counter[14]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[1]),
        .Q(counter[1]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[2]),
        .Q(counter[2]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[3]),
        .Q(counter[3]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[4]),
        .Q(counter[4]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[5]),
        .Q(counter[5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[6]),
        .Q(counter[6]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[7]),
        .Q(counter[7]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[8]),
        .Q(counter[8]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[9]),
        .Q(counter[9]));
  LUT2 #(
    .INIT(4'hE)) 
    \enableCounter[3]_i_1 
       (.I0(Q),
        .I1(Tx_sample_ENABLE),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sample_ENABLE_i_1
       (.I0(Tx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .O(sample_ENABLE_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sample_ENABLE_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(sample_ENABLE_i_1_n_0),
        .Q(Tx_sample_ENABLE));
  LUT5 #(
    .INIT(32'h80000000)) 
    switchEnable_i_1
       (.I0(switchEnable_reg[1]),
        .I1(switchEnable_reg[0]),
        .I2(switchEnable_reg[2]),
        .I3(switchEnable_reg[3]),
        .I4(Tx_sample_ENABLE),
        .O(switchEnable0));
endmodule

(* ORIG_REF_NAME = "baud_controller" *) 
module baud_controller_0
   (E,
    switchEnable0,
    clk_IBUF_BUFG,
    reset_IBUF,
    Rx_EN_IBUF,
    Q,
    baud_select_IBUF,
    switchEnable_reg);
  output [0:0]E;
  output switchEnable0;
  input clk_IBUF_BUFG;
  input reset_IBUF;
  input Rx_EN_IBUF;
  input [0:0]Q;
  input [2:0]baud_select_IBUF;
  input [3:0]switchEnable_reg;

  wire [0:0]E;
  wire [0:0]Q;
  wire Rx_EN_IBUF;
  wire Rx_sample_ENABLE;
  wire [2:0]baud_select_IBUF;
  wire clk_IBUF_BUFG;
  wire counter0_carry__0_n_0;
  wire counter0_carry__0_n_1;
  wire counter0_carry__0_n_2;
  wire counter0_carry__0_n_3;
  wire counter0_carry__0_n_4;
  wire counter0_carry__0_n_5;
  wire counter0_carry__0_n_6;
  wire counter0_carry__0_n_7;
  wire counter0_carry__1_n_0;
  wire counter0_carry__1_n_1;
  wire counter0_carry__1_n_2;
  wire counter0_carry__1_n_3;
  wire counter0_carry__1_n_4;
  wire counter0_carry__1_n_5;
  wire counter0_carry__1_n_6;
  wire counter0_carry__1_n_7;
  wire counter0_carry__2_n_3;
  wire counter0_carry__2_n_6;
  wire counter0_carry__2_n_7;
  wire counter0_carry_n_0;
  wire counter0_carry_n_1;
  wire counter0_carry_n_2;
  wire counter0_carry_n_3;
  wire counter0_carry_n_4;
  wire counter0_carry_n_5;
  wire counter0_carry_n_6;
  wire counter0_carry_n_7;
  wire counter1_carry__0_i_1__0_n_0;
  wire counter1_carry__0_n_3;
  wire counter1_carry_i_1__0_n_0;
  wire counter1_carry_i_2__0_n_0;
  wire counter1_carry_i_3__0_n_0;
  wire counter1_carry_i_4__0_n_0;
  wire counter1_carry_n_0;
  wire counter1_carry_n_1;
  wire counter1_carry_n_2;
  wire counter1_carry_n_3;
  wire \counter[0]_i_1__0_n_0 ;
  wire \counter[10]_i_1__0_n_0 ;
  wire \counter[11]_i_1__0_n_0 ;
  wire \counter[12]_i_1__0_n_0 ;
  wire \counter[13]_i_1__0_n_0 ;
  wire \counter[14]_i_1__0_n_0 ;
  wire \counter[1]_i_1__0_n_0 ;
  wire \counter[2]_i_1__0_n_0 ;
  wire \counter[3]_i_1__0_n_0 ;
  wire \counter[4]_i_1__0_n_0 ;
  wire \counter[5]_i_1__0_n_0 ;
  wire \counter[6]_i_1__0_n_0 ;
  wire \counter[7]_i_1__0_n_0 ;
  wire \counter[8]_i_1__0_n_0 ;
  wire \counter[9]_i_1__0_n_0 ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[10] ;
  wire \counter_reg_n_0_[11] ;
  wire \counter_reg_n_0_[12] ;
  wire \counter_reg_n_0_[13] ;
  wire \counter_reg_n_0_[14] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  wire \counter_reg_n_0_[4] ;
  wire \counter_reg_n_0_[5] ;
  wire \counter_reg_n_0_[6] ;
  wire \counter_reg_n_0_[7] ;
  wire \counter_reg_n_0_[8] ;
  wire \counter_reg_n_0_[9] ;
  wire reset_IBUF;
  wire sample_ENABLE_i_1__0_n_0;
  wire switchEnable0;
  wire [3:0]switchEnable_reg;
  wire [3:1]NLW_counter0_carry__2_CO_UNCONNECTED;
  wire [3:2]NLW_counter0_carry__2_O_UNCONNECTED;
  wire [3:0]NLW_counter1_carry_O_UNCONNECTED;
  wire [3:1]NLW_counter1_carry__0_CO_UNCONNECTED;
  wire [3:0]NLW_counter1_carry__0_O_UNCONNECTED;

  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry
       (.CI(1'b0),
        .CO({counter0_carry_n_0,counter0_carry_n_1,counter0_carry_n_2,counter0_carry_n_3}),
        .CYINIT(\counter_reg_n_0_[0] ),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry_n_4,counter0_carry_n_5,counter0_carry_n_6,counter0_carry_n_7}),
        .S({\counter_reg_n_0_[4] ,\counter_reg_n_0_[3] ,\counter_reg_n_0_[2] ,\counter_reg_n_0_[1] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__0
       (.CI(counter0_carry_n_0),
        .CO({counter0_carry__0_n_0,counter0_carry__0_n_1,counter0_carry__0_n_2,counter0_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry__0_n_4,counter0_carry__0_n_5,counter0_carry__0_n_6,counter0_carry__0_n_7}),
        .S({\counter_reg_n_0_[8] ,\counter_reg_n_0_[7] ,\counter_reg_n_0_[6] ,\counter_reg_n_0_[5] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__1
       (.CI(counter0_carry__0_n_0),
        .CO({counter0_carry__1_n_0,counter0_carry__1_n_1,counter0_carry__1_n_2,counter0_carry__1_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({counter0_carry__1_n_4,counter0_carry__1_n_5,counter0_carry__1_n_6,counter0_carry__1_n_7}),
        .S({\counter_reg_n_0_[12] ,\counter_reg_n_0_[11] ,\counter_reg_n_0_[10] ,\counter_reg_n_0_[9] }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 counter0_carry__2
       (.CI(counter0_carry__1_n_0),
        .CO({NLW_counter0_carry__2_CO_UNCONNECTED[3:1],counter0_carry__2_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({NLW_counter0_carry__2_O_UNCONNECTED[3:2],counter0_carry__2_n_6,counter0_carry__2_n_7}),
        .S({1'b0,1'b0,\counter_reg_n_0_[14] ,\counter_reg_n_0_[13] }));
  CARRY4 counter1_carry
       (.CI(1'b0),
        .CO({counter1_carry_n_0,counter1_carry_n_1,counter1_carry_n_2,counter1_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_counter1_carry_O_UNCONNECTED[3:0]),
        .S({counter1_carry_i_1__0_n_0,counter1_carry_i_2__0_n_0,counter1_carry_i_3__0_n_0,counter1_carry_i_4__0_n_0}));
  CARRY4 counter1_carry__0
       (.CI(counter1_carry_n_0),
        .CO({NLW_counter1_carry__0_CO_UNCONNECTED[3:1],counter1_carry__0_n_3}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_counter1_carry__0_O_UNCONNECTED[3:0]),
        .S({1'b0,1'b0,1'b0,counter1_carry__0_i_1__0_n_0}));
  LUT6 #(
    .INIT(64'h0000000211111210)) 
    counter1_carry__0_i_1__0
       (.I0(\counter_reg_n_0_[12] ),
        .I1(\counter_reg_n_0_[13] ),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[0]),
        .I4(baud_select_IBUF[2]),
        .I5(\counter_reg_n_0_[14] ),
        .O(counter1_carry__0_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0001010012101011)) 
    counter1_carry_i_1__0
       (.I0(\counter_reg_n_0_[9] ),
        .I1(\counter_reg_n_0_[11] ),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[0]),
        .I4(baud_select_IBUF[1]),
        .I5(\counter_reg_n_0_[10] ),
        .O(counter1_carry_i_1__0_n_0));
  LUT6 #(
    .INIT(64'h0000044001226008)) 
    counter1_carry_i_2__0
       (.I0(\counter_reg_n_0_[6] ),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[1]),
        .I4(\counter_reg_n_0_[8] ),
        .I5(\counter_reg_n_0_[7] ),
        .O(counter1_carry_i_2__0_n_0));
  LUT6 #(
    .INIT(64'h4000021004812004)) 
    counter1_carry_i_3__0
       (.I0(\counter_reg_n_0_[3] ),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[0]),
        .I4(\counter_reg_n_0_[5] ),
        .I5(\counter_reg_n_0_[4] ),
        .O(counter1_carry_i_3__0_n_0));
  LUT6 #(
    .INIT(64'h4120088020000006)) 
    counter1_carry_i_4__0
       (.I0(\counter_reg_n_0_[0] ),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[2]),
        .I4(\counter_reg_n_0_[2] ),
        .I5(\counter_reg_n_0_[1] ),
        .O(counter1_carry_i_4__0_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \counter[0]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(\counter_reg_n_0_[0] ),
        .O(\counter[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[10]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__1_n_6),
        .O(\counter[10]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[11]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__1_n_5),
        .O(\counter[11]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[12]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__1_n_4),
        .O(\counter[12]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[13]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__2_n_7),
        .O(\counter[13]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[14]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__2_n_6),
        .O(\counter[14]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[1]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry_n_7),
        .O(\counter[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[2]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry_n_6),
        .O(\counter[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[3]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry_n_5),
        .O(\counter[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[4]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry_n_4),
        .O(\counter[4]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[5]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__0_n_7),
        .O(\counter[5]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[6]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__0_n_6),
        .O(\counter[6]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[7]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__0_n_5),
        .O(\counter[7]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[8]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__0_n_4),
        .O(\counter[8]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[9]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0_carry__1_n_7),
        .O(\counter[9]_i_1__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[0]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[10]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[10] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[11]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[11] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[12]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[12] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[13]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[13] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[14]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[14] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[1]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[2]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[2] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[3]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[3] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[4]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[4] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[5]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[5] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[6]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[6] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[7]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[7] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[8]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[8] ));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\counter[9]_i_1__0_n_0 ),
        .Q(\counter_reg_n_0_[9] ));
  LUT2 #(
    .INIT(4'hE)) 
    \enableCounter[3]_i_1__0 
       (.I0(Q),
        .I1(Rx_sample_ENABLE),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sample_ENABLE_i_1__0
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .O(sample_ENABLE_i_1__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sample_ENABLE_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(sample_ENABLE_i_1__0_n_0),
        .Q(Rx_sample_ENABLE));
  LUT5 #(
    .INIT(32'h08000000)) 
    switchEnable_i_1__0
       (.I0(switchEnable_reg[1]),
        .I1(switchEnable_reg[0]),
        .I2(switchEnable_reg[3]),
        .I3(switchEnable_reg[2]),
        .I4(Rx_sample_ENABLE),
        .O(switchEnable0));
endmodule

(* NotValidForBitStream *)
module uart_channel
   (clk,
    reset,
    Tx_DATA,
    baud_select,
    Tx_EN,
    Rx_EN,
    Tx_WR,
    Rx_DATA,
    Tx_BUSY,
    Rx_PERROR,
    Rx_FERROR,
    Rx_VALID);
  input clk;
  input reset;
  input [7:0]Tx_DATA;
  input [2:0]baud_select;
  input Tx_EN;
  input Rx_EN;
  input Tx_WR;
  output [7:0]Rx_DATA;
  output Tx_BUSY;
  output Rx_PERROR;
  output Rx_FERROR;
  output Rx_VALID;

  wire D;
  wire [7:0]Rx_DATA;
  wire [7:0]Rx_DATA_OBUF;
  wire Rx_EN;
  wire Rx_EN_IBUF;
  wire Rx_FERROR;
  wire Rx_FERROR_OBUF;
  wire Rx_PERROR;
  wire Rx_PERROR_OBUF;
  wire Rx_VALID;
  wire Rx_VALID_OBUF;
  wire Tx_BUSY;
  wire Tx_BUSY_OBUF;
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
  wire reset;
  wire reset_IBUF;

  OBUF \Rx_DATA_OBUF[0]_inst 
       (.I(Rx_DATA_OBUF[0]),
        .O(Rx_DATA[0]));
  OBUF \Rx_DATA_OBUF[1]_inst 
       (.I(Rx_DATA_OBUF[1]),
        .O(Rx_DATA[1]));
  OBUF \Rx_DATA_OBUF[2]_inst 
       (.I(Rx_DATA_OBUF[2]),
        .O(Rx_DATA[2]));
  OBUF \Rx_DATA_OBUF[3]_inst 
       (.I(Rx_DATA_OBUF[3]),
        .O(Rx_DATA[3]));
  OBUF \Rx_DATA_OBUF[4]_inst 
       (.I(Rx_DATA_OBUF[4]),
        .O(Rx_DATA[4]));
  OBUF \Rx_DATA_OBUF[5]_inst 
       (.I(Rx_DATA_OBUF[5]),
        .O(Rx_DATA[5]));
  OBUF \Rx_DATA_OBUF[6]_inst 
       (.I(Rx_DATA_OBUF[6]),
        .O(Rx_DATA[6]));
  OBUF \Rx_DATA_OBUF[7]_inst 
       (.I(Rx_DATA_OBUF[7]),
        .O(Rx_DATA[7]));
  IBUF Rx_EN_IBUF_inst
       (.I(Rx_EN),
        .O(Rx_EN_IBUF));
  OBUF Rx_FERROR_OBUF_inst
       (.I(Rx_FERROR_OBUF),
        .O(Rx_FERROR));
  OBUF Rx_PERROR_OBUF_inst
       (.I(Rx_PERROR_OBUF),
        .O(Rx_PERROR));
  OBUF Rx_VALID_OBUF_inst
       (.I(Rx_VALID_OBUF),
        .O(Rx_VALID));
  OBUF Tx_BUSY_OBUF_inst
       (.I(Tx_BUSY_OBUF),
        .O(Tx_BUSY));
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
  uart_receiver receiver_instance
       (.D(D),
        .Q(Rx_DATA_OBUF),
        .Rx_EN_IBUF(Rx_EN_IBUF),
        .Rx_FERROR_OBUF(Rx_FERROR_OBUF),
        .Rx_PERROR_OBUF(Rx_PERROR_OBUF),
        .Rx_VALID_OBUF(Rx_VALID_OBUF),
        .baud_select_IBUF(baud_select_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  uart_transmitter transmitter_instance
       (.D(D),
        .Tx_BUSY_OBUF(Tx_BUSY_OBUF),
        .Tx_DATA_IBUF(Tx_DATA_IBUF),
        .Tx_EN_IBUF(Tx_EN_IBUF),
        .Tx_WR_IBUF(Tx_WR_IBUF),
        .baud_select_IBUF(baud_select_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF));
endmodule

module uart_receiver
   (Rx_FERROR_OBUF,
    Rx_PERROR_OBUF,
    Rx_VALID_OBUF,
    Q,
    clk_IBUF_BUFG,
    reset_IBUF,
    Rx_EN_IBUF,
    D,
    baud_select_IBUF);
  output Rx_FERROR_OBUF;
  output Rx_PERROR_OBUF;
  output Rx_VALID_OBUF;
  output [7:0]Q;
  input clk_IBUF_BUFG;
  input reset_IBUF;
  input Rx_EN_IBUF;
  input D;
  input [2:0]baud_select_IBUF;

  wire D;
  wire \FSM_onehot_state[0]_i_1__0_n_0 ;
  wire \FSM_onehot_state[0]_i_2_n_0 ;
  wire \FSM_onehot_state[1]_i_1__0_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_1__0_n_0 ;
  wire \FSM_onehot_state[5]_i_1_n_0 ;
  wire \FSM_onehot_state[6]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire [7:0]Q;
  wire [7:0]Rx_DATA_buf;
  wire \Rx_DATA_buf[0]_i_1_n_0 ;
  wire \Rx_DATA_buf[1]_i_1_n_0 ;
  wire \Rx_DATA_buf[2]_i_1_n_0 ;
  wire \Rx_DATA_buf[3]_i_1_n_0 ;
  wire \Rx_DATA_buf[4]_i_1_n_0 ;
  wire \Rx_DATA_buf[4]_i_2_n_0 ;
  wire \Rx_DATA_buf[5]_i_1_n_0 ;
  wire \Rx_DATA_buf[5]_i_2_n_0 ;
  wire \Rx_DATA_buf[6]_i_1_n_0 ;
  wire \Rx_DATA_buf[6]_i_2_n_0 ;
  wire \Rx_DATA_buf[7]_i_1_n_0 ;
  wire Rx_EN_IBUF;
  wire Rx_FERROR_OBUF;
  wire Rx_FERROR_i_1_n_0;
  wire Rx_PERROR_OBUF;
  wire Rx_PERROR_i_1_n_0;
  wire Rx_VALID_OBUF;
  wire Rx_VALID_i_1_n_0;
  wire baud_controller_rx_inst_n_0;
  wire [2:0]baud_select_IBUF;
  wire clk_IBUF_BUFG;
  wire data_i;
  wire \enableCounter[0]_i_1__0_n_0 ;
  wire \enableCounter[1]_i_1__0_n_0 ;
  wire \enableCounter[2]_i_1__0_n_0 ;
  wire \enableCounter[3]_i_2__0_n_0 ;
  wire [3:0]enableCounter_reg;
  wire ferror_i;
  wire idle_i;
  wire [2:0]p_1_in__12;
  wire parity1;
  wire parity_i;
  wire parity_i_1__0_n_0;
  wire parity_i_3__0_n_0;
  wire parity_reg_n_0;
  wire perror_i;
  wire reset_IBUF;
  wire start_i;
  wire switchEnable;
  wire switchEnable0;
  wire valid_i;
  wire \writeCounter[0]_i_1_n_0 ;
  wire \writeCounter[1]_i_1_n_0 ;
  wire \writeCounter[2]_i_1_n_0 ;
  wire \writeCounter_reg_n_0_[0] ;
  wire \writeCounter_reg_n_0_[1] ;
  wire \writeCounter_reg_n_0_[2] ;

  LUT6 #(
    .INIT(64'hFFFFEAEEEAEEEAEE)) 
    \FSM_onehot_state[0]_i_1__0 
       (.I0(\FSM_onehot_state[0]_i_2_n_0 ),
        .I1(idle_i),
        .I2(D),
        .I3(Rx_EN_IBUF),
        .I4(valid_i),
        .I5(switchEnable),
        .O(\FSM_onehot_state[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'hC8)) 
    \FSM_onehot_state[0]_i_2 
       (.I0(perror_i),
        .I1(switchEnable),
        .I2(ferror_i),
        .O(\FSM_onehot_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h20FF2020)) 
    \FSM_onehot_state[1]_i_1__0 
       (.I0(Rx_EN_IBUF),
        .I1(D),
        .I2(idle_i),
        .I3(switchEnable),
        .I4(start_i),
        .O(\FSM_onehot_state[1]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'hFFFF4FFF40404040)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(D),
        .I1(start_i),
        .I2(switchEnable),
        .I3(\writeCounter_reg_n_0_[2] ),
        .I4(\FSM_onehot_state[2]_i_2_n_0 ),
        .I5(data_i),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h7)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\writeCounter_reg_n_0_[1] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .I2(\writeCounter_reg_n_0_[1] ),
        .I3(data_i),
        .I4(switchEnable),
        .I5(parity_i),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h4F40)) 
    \FSM_onehot_state[4]_i_1__0 
       (.I0(parity_reg_n_0),
        .I1(parity_i),
        .I2(switchEnable),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[4]_i_1__0_n_0 ));
  LUT4 #(
    .INIT(16'h8F80)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(D),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(switchEnable),
        .I3(valid_i),
        .O(\FSM_onehot_state[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \FSM_onehot_state[6]_i_1 
       (.I0(parity_reg_n_0),
        .I1(parity_i),
        .I2(switchEnable),
        .I3(perror_i),
        .O(\FSM_onehot_state[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hCFAFC0A0)) 
    \FSM_onehot_state[7]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(start_i),
        .I2(switchEnable),
        .I3(D),
        .I4(ferror_i),
        .O(\FSM_onehot_state[7]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1__0_n_0 ),
        .PRE(reset_IBUF),
        .Q(idle_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[1]_i_1__0_n_0 ),
        .Q(start_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(data_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(parity_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[4]_i_1__0_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[5]_i_1_n_0 ),
        .Q(valid_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[6]_i_1_n_0 ),
        .Q(perror_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:10000000,PERROR:01000000,IDLE:00000001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[7]_i_1_n_0 ),
        .Q(ferror_i));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA_buf[0]_i_1 
       (.I0(D),
        .I1(p_1_in__12[0]),
        .I2(data_i),
        .I3(start_i),
        .I4(Rx_DATA_buf[0]),
        .O(\Rx_DATA_buf[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \Rx_DATA_buf[0]_i_2 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .I2(\writeCounter_reg_n_0_[1] ),
        .O(p_1_in__12[0]));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA_buf[1]_i_1 
       (.I0(D),
        .I1(p_1_in__12[1]),
        .I2(data_i),
        .I3(start_i),
        .I4(Rx_DATA_buf[1]),
        .O(\Rx_DATA_buf[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \Rx_DATA_buf[1]_i_2 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .I2(\writeCounter_reg_n_0_[1] ),
        .O(p_1_in__12[1]));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA_buf[2]_i_1 
       (.I0(D),
        .I1(p_1_in__12[2]),
        .I2(data_i),
        .I3(start_i),
        .I4(Rx_DATA_buf[2]),
        .O(\Rx_DATA_buf[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \Rx_DATA_buf[2]_i_2 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[1] ),
        .I2(\writeCounter_reg_n_0_[0] ),
        .O(p_1_in__12[2]));
  LUT6 #(
    .INIT(64'h0200FEFF02000200)) 
    \Rx_DATA_buf[3]_i_1 
       (.I0(D),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\writeCounter_reg_n_0_[2] ),
        .I3(data_i),
        .I4(start_i),
        .I5(Rx_DATA_buf[3]),
        .O(\Rx_DATA_buf[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA_buf[4]_i_1 
       (.I0(D),
        .I1(\Rx_DATA_buf[4]_i_2_n_0 ),
        .I2(data_i),
        .I3(start_i),
        .I4(Rx_DATA_buf[4]),
        .O(\Rx_DATA_buf[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Rx_DATA_buf[4]_i_2 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .I2(\writeCounter_reg_n_0_[1] ),
        .O(\Rx_DATA_buf[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA_buf[5]_i_1 
       (.I0(D),
        .I1(\Rx_DATA_buf[5]_i_2_n_0 ),
        .I2(data_i),
        .I3(start_i),
        .I4(Rx_DATA_buf[5]),
        .O(\Rx_DATA_buf[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \Rx_DATA_buf[5]_i_2 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .I2(\writeCounter_reg_n_0_[1] ),
        .O(\Rx_DATA_buf[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA_buf[6]_i_1 
       (.I0(D),
        .I1(\Rx_DATA_buf[6]_i_2_n_0 ),
        .I2(data_i),
        .I3(start_i),
        .I4(Rx_DATA_buf[6]),
        .O(\Rx_DATA_buf[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \Rx_DATA_buf[6]_i_2 
       (.I0(\writeCounter_reg_n_0_[2] ),
        .I1(\writeCounter_reg_n_0_[1] ),
        .I2(\writeCounter_reg_n_0_[0] ),
        .O(\Rx_DATA_buf[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2000EFFF20002000)) 
    \Rx_DATA_buf[7]_i_1 
       (.I0(D),
        .I1(\FSM_onehot_state[2]_i_2_n_0 ),
        .I2(\writeCounter_reg_n_0_[2] ),
        .I3(data_i),
        .I4(start_i),
        .I5(Rx_DATA_buf[7]),
        .O(\Rx_DATA_buf[7]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[0]_i_1_n_0 ),
        .Q(Rx_DATA_buf[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[1]_i_1_n_0 ),
        .Q(Rx_DATA_buf[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[2]_i_1_n_0 ),
        .Q(Rx_DATA_buf[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[3]_i_1_n_0 ),
        .Q(Rx_DATA_buf[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[4]_i_1_n_0 ),
        .Q(Rx_DATA_buf[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[5]_i_1_n_0 ),
        .Q(Rx_DATA_buf[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[6]_i_1_n_0 ),
        .Q(Rx_DATA_buf[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_buf_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA_buf[7]_i_1_n_0 ),
        .Q(Rx_DATA_buf[7]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[0]),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[5]),
        .Q(Q[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[6]),
        .Q(Q[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(valid_i),
        .CLR(reset_IBUF),
        .D(Rx_DATA_buf[7]),
        .Q(Q[7]));
  LUT2 #(
    .INIT(4'hE)) 
    Rx_FERROR_i_1
       (.I0(ferror_i),
        .I1(start_i),
        .O(Rx_FERROR_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Rx_FERROR_reg
       (.C(clk_IBUF_BUFG),
        .CE(Rx_FERROR_i_1_n_0),
        .CLR(reset_IBUF),
        .D(ferror_i),
        .Q(Rx_FERROR_OBUF));
  LUT2 #(
    .INIT(4'hE)) 
    Rx_PERROR_i_1
       (.I0(perror_i),
        .I1(start_i),
        .O(Rx_PERROR_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Rx_PERROR_reg
       (.C(clk_IBUF_BUFG),
        .CE(Rx_PERROR_i_1_n_0),
        .CLR(reset_IBUF),
        .D(perror_i),
        .Q(Rx_PERROR_OBUF));
  LUT2 #(
    .INIT(4'hE)) 
    Rx_VALID_i_1
       (.I0(valid_i),
        .I1(start_i),
        .O(Rx_VALID_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Rx_VALID_reg
       (.C(clk_IBUF_BUFG),
        .CE(Rx_VALID_i_1_n_0),
        .CLR(reset_IBUF),
        .D(valid_i),
        .Q(Rx_VALID_OBUF));
  baud_controller_0 baud_controller_rx_inst
       (.E(baud_controller_rx_inst_n_0),
        .Q(idle_i),
        .Rx_EN_IBUF(Rx_EN_IBUF),
        .baud_select_IBUF(baud_select_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF),
        .switchEnable0(switchEnable0),
        .switchEnable_reg(enableCounter_reg));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \enableCounter[0]_i_1__0 
       (.I0(enableCounter_reg[0]),
        .I1(idle_i),
        .O(\enableCounter[0]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \enableCounter[1]_i_1__0 
       (.I0(enableCounter_reg[1]),
        .I1(enableCounter_reg[0]),
        .I2(idle_i),
        .O(\enableCounter[1]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \enableCounter[2]_i_1__0 
       (.I0(enableCounter_reg[2]),
        .I1(enableCounter_reg[1]),
        .I2(enableCounter_reg[0]),
        .I3(idle_i),
        .O(\enableCounter[2]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \enableCounter[3]_i_2__0 
       (.I0(enableCounter_reg[3]),
        .I1(enableCounter_reg[2]),
        .I2(enableCounter_reg[0]),
        .I3(enableCounter_reg[1]),
        .I4(idle_i),
        .O(\enableCounter[3]_i_2__0_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[0]_i_1__0_n_0 ),
        .Q(enableCounter_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[1]_i_1__0_n_0 ),
        .Q(enableCounter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[2]_i_1__0_n_0 ),
        .Q(enableCounter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[3]_i_2__0_n_0 ),
        .Q(enableCounter_reg[3]));
  LUT4 #(
    .INIT(16'h6F60)) 
    parity_i_1__0
       (.I0(parity1),
        .I1(D),
        .I2(parity_i),
        .I3(parity_reg_n_0),
        .O(parity_i_1__0_n_0));
  LUT5 #(
    .INIT(32'h96696996)) 
    parity_i_2__0
       (.I0(Rx_DATA_buf[5]),
        .I1(Rx_DATA_buf[4]),
        .I2(Rx_DATA_buf[7]),
        .I3(Rx_DATA_buf[6]),
        .I4(parity_i_3__0_n_0),
        .O(parity1));
  LUT4 #(
    .INIT(16'h6996)) 
    parity_i_3__0
       (.I0(Rx_DATA_buf[2]),
        .I1(Rx_DATA_buf[3]),
        .I2(Rx_DATA_buf[0]),
        .I3(Rx_DATA_buf[1]),
        .O(parity_i_3__0_n_0));
  FDCE #(
    .INIT(1'b0)) 
    parity_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(parity_i_1__0_n_0),
        .Q(parity_reg_n_0));
  FDCE #(
    .INIT(1'b0)) 
    switchEnable_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(switchEnable0),
        .Q(switchEnable));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \writeCounter[0]_i_1 
       (.I0(switchEnable),
        .I1(data_i),
        .I2(\writeCounter_reg_n_0_[0] ),
        .O(\writeCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \writeCounter[1]_i_1 
       (.I0(\writeCounter_reg_n_0_[0] ),
        .I1(data_i),
        .I2(switchEnable),
        .I3(\writeCounter_reg_n_0_[1] ),
        .O(\writeCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \writeCounter[2]_i_1 
       (.I0(\writeCounter_reg_n_0_[0] ),
        .I1(\writeCounter_reg_n_0_[1] ),
        .I2(data_i),
        .I3(switchEnable),
        .I4(\writeCounter_reg_n_0_[2] ),
        .O(\writeCounter[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \writeCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writeCounter[0]_i_1_n_0 ),
        .Q(\writeCounter_reg_n_0_[0] ));
  FDCE #(
    .INIT(1'b0)) 
    \writeCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writeCounter[1]_i_1_n_0 ),
        .Q(\writeCounter_reg_n_0_[1] ));
  FDCE #(
    .INIT(1'b0)) 
    \writeCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writeCounter[2]_i_1_n_0 ),
        .Q(\writeCounter_reg_n_0_[2] ));
endmodule

module uart_transmitter
   (Tx_BUSY_OBUF,
    D,
    clk_IBUF_BUFG,
    reset_IBUF,
    Tx_EN_IBUF,
    Tx_WR_IBUF,
    baud_select_IBUF,
    Tx_DATA_IBUF);
  output Tx_BUSY_OBUF;
  output D;
  input clk_IBUF_BUFG;
  input reset_IBUF;
  input Tx_EN_IBUF;
  input Tx_WR_IBUF;
  input [2:0]baud_select_IBUF;
  input [7:0]Tx_DATA_IBUF;

  wire D;
  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1__0_n_0 ;
  wire \FSM_onehot_state[3]_i_1__0_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_3_n_0 ;
  wire \FSM_onehot_state[7]_i_4_n_0 ;
  wire \FSM_onehot_state[7]_i_5_n_0 ;
  wire \FSM_onehot_state[7]_i_6_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire Tx_BUSY_OBUF;
  wire [7:0]Tx_DATA_IBUF;
  wire Tx_EN_IBUF;
  wire Tx_WR_IBUF;
  wire baud_controller_tx_inst_n_0;
  wire [2:0]baud_select_IBUF;
  wire clk_IBUF_BUFG;
  wire data_i;
  wire \enableCounter[0]_i_1_n_0 ;
  wire \enableCounter[1]_i_1_n_0 ;
  wire \enableCounter[2]_i_1_n_0 ;
  wire \enableCounter[3]_i_2_n_0 ;
  wire [3:0]enableCounter_reg;
  wire idle_i;
  wire parity;
  wire parity_i_1_n_0;
  wire parity_i_2_n_0;
  wire parity_i_3_n_0;
  wire reset_IBUF;
  wire switchEnable;
  wire switchEnable0;
  wire [2:0]writeCounter;
  wire \writeCounter[0]_i_1_n_0 ;
  wire \writeCounter[1]_i_1_n_0 ;
  wire \writeCounter[2]_i_1_n_0 ;

  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT5 #(
    .INIT(32'hFF707070)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(Tx_WR_IBUF),
        .I2(idle_i),
        .I3(switchEnable),
        .I4(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80FF8080)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(Tx_WR_IBUF),
        .I2(idle_i),
        .I3(switchEnable),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF88888888)) 
    \FSM_onehot_state[2]_i_1__0 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(switchEnable),
        .I2(writeCounter[2]),
        .I3(writeCounter[0]),
        .I4(writeCounter[1]),
        .I5(data_i),
        .O(\FSM_onehot_state[2]_i_1__0_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    \FSM_onehot_state[3]_i_1__0 
       (.I0(writeCounter[2]),
        .I1(writeCounter[0]),
        .I2(writeCounter[1]),
        .I3(data_i),
        .I4(switchEnable),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[3]_i_1__0_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(switchEnable),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEAAAEA)) 
    \FSM_onehot_state[7]_i_2 
       (.I0(\FSM_onehot_state[7]_i_3_n_0 ),
        .I1(data_i),
        .I2(\FSM_onehot_state[7]_i_4_n_0 ),
        .I3(writeCounter[2]),
        .I4(\FSM_onehot_state[7]_i_5_n_0 ),
        .I5(\FSM_onehot_state[7]_i_6_n_0 ),
        .O(D));
  (* SOFT_HLUTNM = "soft_lutpair24" *) 
  LUT2 #(
    .INIT(4'hE)) 
    \FSM_onehot_state[7]_i_3 
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(idle_i),
        .O(\FSM_onehot_state[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \FSM_onehot_state[7]_i_4 
       (.I0(Tx_DATA_IBUF[3]),
        .I1(Tx_DATA_IBUF[2]),
        .I2(writeCounter[1]),
        .I3(Tx_DATA_IBUF[1]),
        .I4(writeCounter[0]),
        .I5(Tx_DATA_IBUF[0]),
        .O(\FSM_onehot_state[7]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \FSM_onehot_state[7]_i_5 
       (.I0(Tx_DATA_IBUF[7]),
        .I1(Tx_DATA_IBUF[6]),
        .I2(writeCounter[1]),
        .I3(Tx_DATA_IBUF[5]),
        .I4(writeCounter[0]),
        .I5(Tx_DATA_IBUF[4]),
        .O(\FSM_onehot_state[7]_i_5_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \FSM_onehot_state[7]_i_6 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(parity),
        .O(\FSM_onehot_state[7]_i_6_n_0 ));
  (* FSM_ENCODED_STATES = "START:00010,DATA:00100,PARITY:01000,STOP:10000,IDLE:00001" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(reset_IBUF),
        .Q(idle_i));
  (* FSM_ENCODED_STATES = "START:00010,DATA:00100,PARITY:01000,STOP:10000,IDLE:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "START:00010,DATA:00100,PARITY:01000,STOP:10000,IDLE:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[2]_i_1__0_n_0 ),
        .Q(data_i));
  (* FSM_ENCODED_STATES = "START:00010,DATA:00100,PARITY:01000,STOP:10000,IDLE:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[3]_i_1__0_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "START:00010,DATA:00100,PARITY:01000,STOP:10000,IDLE:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ));
  (* SOFT_HLUTNM = "soft_lutpair28" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Tx_BUSY_OBUF_inst_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(data_i),
        .O(Tx_BUSY_OBUF));
  baud_controller baud_controller_tx_inst
       (.E(baud_controller_tx_inst_n_0),
        .Q(idle_i),
        .Tx_EN_IBUF(Tx_EN_IBUF),
        .baud_select_IBUF(baud_select_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF),
        .switchEnable0(switchEnable0),
        .switchEnable_reg(enableCounter_reg));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \enableCounter[0]_i_1 
       (.I0(enableCounter_reg[0]),
        .I1(idle_i),
        .O(\enableCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair29" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \enableCounter[1]_i_1 
       (.I0(enableCounter_reg[1]),
        .I1(enableCounter_reg[0]),
        .I2(idle_i),
        .O(\enableCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \enableCounter[2]_i_1 
       (.I0(enableCounter_reg[2]),
        .I1(enableCounter_reg[1]),
        .I2(enableCounter_reg[0]),
        .I3(idle_i),
        .O(\enableCounter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair25" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \enableCounter[3]_i_2 
       (.I0(enableCounter_reg[3]),
        .I1(enableCounter_reg[2]),
        .I2(enableCounter_reg[0]),
        .I3(enableCounter_reg[1]),
        .I4(idle_i),
        .O(\enableCounter[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_tx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[0]_i_1_n_0 ),
        .Q(enableCounter_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_tx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[1]_i_1_n_0 ),
        .Q(enableCounter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_tx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[2]_i_1_n_0 ),
        .Q(enableCounter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_tx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[3]_i_2_n_0 ),
        .Q(enableCounter_reg[3]));
  (* SOFT_HLUTNM = "soft_lutpair27" *) 
  LUT4 #(
    .INIT(16'h6F60)) 
    parity_i_1
       (.I0(parity_i_2_n_0),
        .I1(parity_i_3_n_0),
        .I2(data_i),
        .I3(parity),
        .O(parity_i_1_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    parity_i_2
       (.I0(Tx_DATA_IBUF[6]),
        .I1(Tx_DATA_IBUF[7]),
        .I2(Tx_DATA_IBUF[4]),
        .I3(Tx_DATA_IBUF[5]),
        .O(parity_i_2_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    parity_i_3
       (.I0(Tx_DATA_IBUF[2]),
        .I1(Tx_DATA_IBUF[3]),
        .I2(Tx_DATA_IBUF[0]),
        .I3(Tx_DATA_IBUF[1]),
        .O(parity_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    parity_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(parity_i_1_n_0),
        .Q(parity));
  FDCE #(
    .INIT(1'b0)) 
    switchEnable_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(switchEnable0),
        .Q(switchEnable));
  LUT3 #(
    .INIT(8'h78)) 
    \writeCounter[0]_i_1 
       (.I0(switchEnable),
        .I1(data_i),
        .I2(writeCounter[0]),
        .O(\writeCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \writeCounter[1]_i_1 
       (.I0(writeCounter[0]),
        .I1(data_i),
        .I2(switchEnable),
        .I3(writeCounter[1]),
        .O(\writeCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair26" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \writeCounter[2]_i_1 
       (.I0(writeCounter[0]),
        .I1(writeCounter[1]),
        .I2(data_i),
        .I3(switchEnable),
        .I4(writeCounter[2]),
        .O(\writeCounter[2]_i_1_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \writeCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writeCounter[0]_i_1_n_0 ),
        .Q(writeCounter[0]));
  FDCE #(
    .INIT(1'b0)) 
    \writeCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writeCounter[1]_i_1_n_0 ),
        .Q(writeCounter[1]));
  FDCE #(
    .INIT(1'b0)) 
    \writeCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\writeCounter[2]_i_1_n_0 ),
        .Q(writeCounter[2]));
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
