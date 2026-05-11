// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Tue Oct 29 23:49:13 2024
// Host        : master0 running 64-bit unknown
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/bill/projects/project2/Working/lab_project_2_partA.sim/sim_1/impl/func/xsim/baud_controller_tb_func_impl.v
// Design      : baud_controller
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* ECO_CHECKSUM = "93256826" *) 
(* NotValidForBitStream *)
(* \DesignAttr:ENABLE_NOC_NETLIST_VIEW  *) 
(* \DesignAttr:ENABLE_AIE_NETLIST_VIEW  *) 
module baud_controller
   (reset,
    clk,
    baud_select,
    sample_ENABLE);
  input reset;
  input clk;
  input [2:0]baud_select;
  output sample_ENABLE;

  wire [2:0]baud_select;
  wire [2:0]baud_select_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [14:0]countMax;
  wire [14:0]countMaxPrev;
  wire \countMaxPrev[7]_i_1_n_0 ;
  wire [14:0]counter;
  wire [14:1]counter0;
  wire \counter[14]_i_10_n_0 ;
  wire \counter[14]_i_11_n_0 ;
  wire \counter[14]_i_12_n_0 ;
  wire \counter[14]_i_13_n_0 ;
  wire \counter[14]_i_14_n_0 ;
  wire \counter[14]_i_15_n_0 ;
  wire \counter[14]_i_16_n_0 ;
  wire \counter[14]_i_6_n_0 ;
  wire \counter[14]_i_8_n_0 ;
  wire \counter[14]_i_9_n_0 ;
  wire \counter_reg[12]_i_2_n_0 ;
  wire \counter_reg[14]_i_2_n_3 ;
  wire \counter_reg[14]_i_4_n_3 ;
  wire \counter_reg[14]_i_5_n_0 ;
  wire \counter_reg[14]_i_7_n_0 ;
  wire \counter_reg[4]_i_2_n_0 ;
  wire \counter_reg[8]_i_2_n_0 ;
  wire [14:0]p_0_in;
  wire reset;
  wire reset_IBUF;
  wire sample_ENABLE;
  wire sample_ENABLE_OBUF;
  wire sample_ENABLE_i_1_n_0;
  wire [2:0]\NLW_counter_reg[12]_i_2_CO_UNCONNECTED ;
  wire [3:1]\NLW_counter_reg[14]_i_2_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[14]_i_2_O_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[14]_i_3_CO_UNCONNECTED ;
  wire [3:2]\NLW_counter_reg[14]_i_3_O_UNCONNECTED ;
  wire [3:1]\NLW_counter_reg[14]_i_4_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[14]_i_4_O_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[14]_i_5_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[14]_i_5_O_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[14]_i_7_CO_UNCONNECTED ;
  wire [3:0]\NLW_counter_reg[14]_i_7_O_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[4]_i_2_CO_UNCONNECTED ;
  wire [2:0]\NLW_counter_reg[8]_i_2_CO_UNCONNECTED ;

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
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h0D)) 
    \countMaxPrev[0]_i_1 
       (.I0(baud_select_IBUF[0]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[1]),
        .O(countMax[0]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \countMaxPrev[10]_i_1 
       (.I0(baud_select_IBUF[1]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[2]),
        .O(countMax[10]));
  LUT2 #(
    .INIT(4'h1)) 
    \countMaxPrev[12]_i_1 
       (.I0(baud_select_IBUF[2]),
        .I1(baud_select_IBUF[1]),
        .O(countMax[12]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \countMaxPrev[14]_i_1 
       (.I0(baud_select_IBUF[2]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[1]),
        .O(countMax[14]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hA4)) 
    \countMaxPrev[1]_i_1 
       (.I0(baud_select_IBUF[0]),
        .I1(baud_select_IBUF[1]),
        .I2(baud_select_IBUF[2]),
        .O(countMax[1]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hAE)) 
    \countMaxPrev[2]_i_1 
       (.I0(baud_select_IBUF[1]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[0]),
        .O(countMax[2]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'h4A)) 
    \countMaxPrev[3]_i_1 
       (.I0(baud_select_IBUF[0]),
        .I1(baud_select_IBUF[1]),
        .I2(baud_select_IBUF[2]),
        .O(countMax[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h86)) 
    \countMaxPrev[4]_i_1 
       (.I0(baud_select_IBUF[0]),
        .I1(baud_select_IBUF[1]),
        .I2(baud_select_IBUF[2]),
        .O(countMax[4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hE1)) 
    \countMaxPrev[5]_i_1 
       (.I0(baud_select_IBUF[0]),
        .I1(baud_select_IBUF[1]),
        .I2(baud_select_IBUF[2]),
        .O(countMax[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h47)) 
    \countMaxPrev[6]_i_1 
       (.I0(baud_select_IBUF[0]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[1]),
        .O(countMax[6]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h60)) 
    \countMaxPrev[7]_i_1 
       (.I0(baud_select_IBUF[2]),
        .I1(baud_select_IBUF[1]),
        .I2(baud_select_IBUF[0]),
        .O(\countMaxPrev[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h07)) 
    \countMaxPrev[8]_i_1 
       (.I0(baud_select_IBUF[1]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[0]),
        .O(countMax[8]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \countMaxPrev[9]_i_1 
       (.I0(baud_select_IBUF[1]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[2]),
        .O(countMax[9]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[0]),
        .Q(countMaxPrev[0]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[10]),
        .Q(countMaxPrev[10]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[12]),
        .Q(countMaxPrev[12]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[14]),
        .Q(countMaxPrev[14]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[1]),
        .Q(countMaxPrev[1]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[2]),
        .Q(countMaxPrev[2]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[3]),
        .Q(countMaxPrev[3]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[4]),
        .Q(countMaxPrev[4]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[5]),
        .Q(countMaxPrev[5]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[6]),
        .Q(countMaxPrev[6]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\countMaxPrev[7]_i_1_n_0 ),
        .Q(countMaxPrev[7]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[8]),
        .Q(countMaxPrev[8]));
  FDCE #(
    .INIT(1'b0)) 
    \countMaxPrev_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(countMax[9]),
        .Q(countMaxPrev[9]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \counter[0]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter[0]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[10]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[10]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[11]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[11]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[12]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[12]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[13]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[13]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[14]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[14]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[14]));
  LUT6 #(
    .INIT(64'h0000044001226008)) 
    \counter[14]_i_10 
       (.I0(counter[6]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[1]),
        .I4(counter[8]),
        .I5(counter[7]),
        .O(\counter[14]_i_10_n_0 ));
  LUT6 #(
    .INIT(64'h4000021004812004)) 
    \counter[14]_i_11 
       (.I0(counter[3]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[0]),
        .I4(counter[5]),
        .I5(counter[4]),
        .O(\counter[14]_i_11_n_0 ));
  LUT6 #(
    .INIT(64'h4100008014200006)) 
    \counter[14]_i_12 
       (.I0(counter[0]),
        .I1(baud_select_IBUF[0]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[1]),
        .I4(counter[2]),
        .I5(counter[1]),
        .O(\counter[14]_i_12_n_0 ));
  LUT5 #(
    .INIT(32'h00145581)) 
    \counter[14]_i_13 
       (.I0(countMaxPrev[9]),
        .I1(baud_select_IBUF[1]),
        .I2(baud_select_IBUF[0]),
        .I3(baud_select_IBUF[2]),
        .I4(countMaxPrev[10]),
        .O(\counter[14]_i_13_n_0 ));
  LUT6 #(
    .INIT(64'h0010100012040828)) 
    \counter[14]_i_14 
       (.I0(countMaxPrev[6]),
        .I1(countMaxPrev[8]),
        .I2(baud_select_IBUF[0]),
        .I3(baud_select_IBUF[2]),
        .I4(baud_select_IBUF[1]),
        .I5(countMaxPrev[7]),
        .O(\counter[14]_i_14_n_0 ));
  LUT6 #(
    .INIT(64'h4002010002408014)) 
    \counter[14]_i_15 
       (.I0(countMaxPrev[3]),
        .I1(countMaxPrev[5]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[1]),
        .I4(baud_select_IBUF[0]),
        .I5(countMaxPrev[4]),
        .O(\counter[14]_i_15_n_0 ));
  LUT6 #(
    .INIT(64'h4004200004400812)) 
    \counter[14]_i_16 
       (.I0(countMaxPrev[0]),
        .I1(countMaxPrev[2]),
        .I2(baud_select_IBUF[0]),
        .I3(baud_select_IBUF[2]),
        .I4(baud_select_IBUF[1]),
        .I5(countMaxPrev[1]),
        .O(\counter[14]_i_16_n_0 ));
  LUT6 #(
    .INIT(64'h0000000211111210)) 
    \counter[14]_i_6 
       (.I0(counter[12]),
        .I1(counter[13]),
        .I2(baud_select_IBUF[1]),
        .I3(baud_select_IBUF[0]),
        .I4(baud_select_IBUF[2]),
        .I5(counter[14]),
        .O(\counter[14]_i_6_n_0 ));
  LUT5 #(
    .INIT(32'h00025564)) 
    \counter[14]_i_8 
       (.I0(countMaxPrev[12]),
        .I1(baud_select_IBUF[2]),
        .I2(baud_select_IBUF[0]),
        .I3(baud_select_IBUF[1]),
        .I4(countMaxPrev[14]),
        .O(\counter[14]_i_8_n_0 ));
  LUT6 #(
    .INIT(64'h0001010012101011)) 
    \counter[14]_i_9 
       (.I0(counter[9]),
        .I1(counter[11]),
        .I2(baud_select_IBUF[2]),
        .I3(baud_select_IBUF[0]),
        .I4(baud_select_IBUF[1]),
        .I5(counter[10]),
        .O(\counter[14]_i_9_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[1]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[1]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[2]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[2]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[3]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[3]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[4]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[4]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[5]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[5]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[6]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[6]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[7]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[7]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[8]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[8]),
        .I2(\counter_reg[14]_i_4_n_3 ),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \counter[9]_i_1 
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(counter0[9]),
        .I2(\counter_reg[14]_i_4_n_3 ),
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
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[12]_i_2 
       (.CI(\counter_reg[8]_i_2_n_0 ),
        .CO({\counter_reg[12]_i_2_n_0 ,\NLW_counter_reg[12]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[12:9]),
        .S(counter[12:9]));
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
  CARRY4 \counter_reg[14]_i_2 
       (.CI(\counter_reg[14]_i_5_n_0 ),
        .CO({\NLW_counter_reg[14]_i_2_CO_UNCONNECTED [3:1],\counter_reg[14]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_counter_reg[14]_i_2_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\counter[14]_i_6_n_0 }));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[14]_i_3 
       (.CI(\counter_reg[12]_i_2_n_0 ),
        .CO(\NLW_counter_reg[14]_i_3_CO_UNCONNECTED [3:0]),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_counter_reg[14]_i_3_O_UNCONNECTED [3:2],counter0[14:13]}),
        .S({1'b0,1'b0,counter[14:13]}));
  CARRY4 \counter_reg[14]_i_4 
       (.CI(\counter_reg[14]_i_7_n_0 ),
        .CO({\NLW_counter_reg[14]_i_4_CO_UNCONNECTED [3:1],\counter_reg[14]_i_4_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O(\NLW_counter_reg[14]_i_4_O_UNCONNECTED [3:0]),
        .S({1'b0,1'b0,1'b0,\counter[14]_i_8_n_0 }));
  CARRY4 \counter_reg[14]_i_5 
       (.CI(1'b0),
        .CO({\counter_reg[14]_i_5_n_0 ,\NLW_counter_reg[14]_i_5_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\NLW_counter_reg[14]_i_5_O_UNCONNECTED [3:0]),
        .S({\counter[14]_i_9_n_0 ,\counter[14]_i_10_n_0 ,\counter[14]_i_11_n_0 ,\counter[14]_i_12_n_0 }));
  CARRY4 \counter_reg[14]_i_7 
       (.CI(1'b0),
        .CO({\counter_reg[14]_i_7_n_0 ,\NLW_counter_reg[14]_i_7_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b1,1'b1,1'b1,1'b1}),
        .O(\NLW_counter_reg[14]_i_7_O_UNCONNECTED [3:0]),
        .S({\counter[14]_i_13_n_0 ,\counter[14]_i_14_n_0 ,\counter[14]_i_15_n_0 ,\counter[14]_i_16_n_0 }));
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
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[4]_i_2 
       (.CI(1'b0),
        .CO({\counter_reg[4]_i_2_n_0 ,\NLW_counter_reg[4]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(counter[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[4:1]),
        .S(counter[4:1]));
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
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \counter_reg[8]_i_2 
       (.CI(\counter_reg[4]_i_2_n_0 ),
        .CO({\counter_reg[8]_i_2_n_0 ,\NLW_counter_reg[8]_i_2_CO_UNCONNECTED [2:0]}),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(counter0[8:5]),
        .S(counter[8:5]));
  FDCE #(
    .INIT(1'b0)) 
    \counter_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(p_0_in[9]),
        .Q(counter[9]));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  OBUF sample_ENABLE_OBUF_inst
       (.I(sample_ENABLE_OBUF),
        .O(sample_ENABLE));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT2 #(
    .INIT(4'h2)) 
    sample_ENABLE_i_1
       (.I0(\counter_reg[14]_i_2_n_3 ),
        .I1(\counter_reg[14]_i_4_n_3 ),
        .O(sample_ENABLE_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sample_ENABLE_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(sample_ENABLE_i_1_n_0),
        .Q(sample_ENABLE_OBUF));
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
