// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Wed Nov  6 15:40:30 2024
// Host        : master0 running 64-bit unknown
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/billm123/digsys-project-2/PartB/lab_project_2_partA.sim/sim_1/synth/timing/xsim/uart_transmitter_tb_time_synth.v
// Design      : uart_transmitter
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module baud_controller
   (E,
    sample_ENABLE_reg_0,
    CLK,
    AR,
    Tx_EN_IBUF,
    Q,
    baud_select_IBUF,
    switchEnable_reg,
    switchEnable);
  output [0:0]E;
  output sample_ENABLE_reg_0;
  input CLK;
  input [0:0]AR;
  input Tx_EN_IBUF;
  input [0:0]Q;
  input [2:0]baud_select_IBUF;
  input [3:0]switchEnable_reg;
  input switchEnable;

  wire [0:0]AR;
  wire CLK;
  wire [0:0]E;
  wire [0:0]Q;
  wire Tx_EN_IBUF;
  wire Tx_sample_ENABLE;
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
  wire sample_ENABLE_reg_0;
  wire switchEnable;
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
  LUT2 #(
    .INIT(4'hE)) 
    \enableCounter[3]_i_1 
       (.I0(Q),
        .I1(Tx_sample_ENABLE),
        .O(E));
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
        .Q(Tx_sample_ENABLE));
  LUT6 #(
    .INIT(64'hBFFFFFFF80000000)) 
    switchEnable_i_1
       (.I0(Tx_sample_ENABLE),
        .I1(switchEnable_reg[1]),
        .I2(switchEnable_reg[0]),
        .I3(switchEnable_reg[2]),
        .I4(switchEnable_reg[3]),
        .I5(switchEnable),
        .O(sample_ENABLE_reg_0));
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

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[0] ;
  wire \FSM_onehot_state_reg_n_0_[1] ;
  wire \FSM_onehot_state_reg_n_0_[3] ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire TxD;
  wire TxD_OBUF;
  wire TxD_OBUF_inst_i_2_n_0;
  wire TxD_OBUF_inst_i_3_n_0;
  wire Tx_BUSY;
  wire Tx_BUSY_OBUF;
  wire [7:0]Tx_DATA;
  wire [7:0]Tx_DATA_IBUF;
  wire Tx_EN;
  wire Tx_EN_IBUF;
  wire Tx_WR;
  wire Tx_WR_IBUF;
  wire baud_controller_tx_inst_n_1;
  wire [2:0]baud_select;
  wire [2:0]baud_select_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire enableCounter;
  wire \enableCounter[0]_i_1_n_0 ;
  wire \enableCounter[1]_i_1_n_0 ;
  wire \enableCounter[2]_i_1_n_0 ;
  wire \enableCounter[3]_i_2_n_0 ;
  wire [3:0]enableCounter__0;
  wire reset;
  wire reset_IBUF;
  wire switchEnable;
  wire writeCounter;
  wire \writeCounter[0]_i_1_n_0 ;
  wire \writeCounter[1]_i_1_n_0 ;
  wire \writeCounter[2]_i_1_n_0 ;
  wire \writeCounter_reg_n_0_[0] ;
  wire \writeCounter_reg_n_0_[1] ;
  wire \writeCounter_reg_n_0_[2] ;

initial begin
 $sdf_annotate("uart_transmitter_tb_time_synth.sdf",,,,"tool_control");
end
  LUT5 #(
    .INIT(32'hFF707070)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(Tx_WR_IBUF),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(switchEnable),
        .I4(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80FF8080)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(Tx_EN_IBUF),
        .I1(Tx_WR_IBUF),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(switchEnable),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFFAAAA0000)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\writeCounter_reg_n_0_[2] ),
        .I2(\writeCounter_reg_n_0_[0] ),
        .I3(\writeCounter_reg_n_0_[1] ),
        .I4(switchEnable),
        .I5(writeCounter),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(\writeCounter_reg_n_0_[1] ),
        .I1(\writeCounter_reg_n_0_[0] ),
        .I2(\writeCounter_reg_n_0_[2] ),
        .I3(writeCounter),
        .I4(switchEnable),
        .I5(\FSM_onehot_state_reg_n_0_[3] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[3] ),
        .I1(switchEnable),
        .I2(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(reset_IBUF),
        .Q(\FSM_onehot_state_reg_n_0_[0] ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[1] ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(writeCounter));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[3] ));
  (* FSM_ENCODED_STATES = "iSTATE:00010,iSTATE0:00100,iSTATE1:01000,iSTATE2:10000,iSTATE3:00001" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ));
  OBUF TxD_OBUF_inst
       (.I(TxD_OBUF),
        .O(TxD));
  LUT6 #(
    .INIT(64'hFFFFFFFFEEEAAAEA)) 
    TxD_OBUF_inst_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(writeCounter),
        .I2(TxD_OBUF_inst_i_2_n_0),
        .I3(\writeCounter_reg_n_0_[2] ),
        .I4(TxD_OBUF_inst_i_3_n_0),
        .I5(\FSM_onehot_state_reg_n_0_[4] ),
        .O(TxD_OBUF));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    TxD_OBUF_inst_i_2
       (.I0(Tx_DATA_IBUF[3]),
        .I1(Tx_DATA_IBUF[2]),
        .I2(\writeCounter_reg_n_0_[1] ),
        .I3(Tx_DATA_IBUF[1]),
        .I4(\writeCounter_reg_n_0_[0] ),
        .I5(Tx_DATA_IBUF[0]),
        .O(TxD_OBUF_inst_i_2_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    TxD_OBUF_inst_i_3
       (.I0(Tx_DATA_IBUF[7]),
        .I1(Tx_DATA_IBUF[6]),
        .I2(\writeCounter_reg_n_0_[1] ),
        .I3(Tx_DATA_IBUF[5]),
        .I4(\writeCounter_reg_n_0_[0] ),
        .I5(Tx_DATA_IBUF[4]),
        .O(TxD_OBUF_inst_i_3_n_0));
  OBUF Tx_BUSY_OBUF_inst
       (.I(Tx_BUSY_OBUF),
        .O(Tx_BUSY));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    Tx_BUSY_OBUF_inst_i_1
       (.I0(\FSM_onehot_state_reg_n_0_[4] ),
        .I1(\FSM_onehot_state_reg_n_0_[3] ),
        .I2(\FSM_onehot_state_reg_n_0_[1] ),
        .I3(writeCounter),
        .O(Tx_BUSY_OBUF));
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
        .E(enableCounter),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .Tx_EN_IBUF(Tx_EN_IBUF),
        .baud_select_IBUF(baud_select_IBUF),
        .sample_ENABLE_reg_0(baud_controller_tx_inst_n_1),
        .switchEnable(switchEnable),
        .switchEnable_reg(enableCounter__0));
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
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \enableCounter[0]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(enableCounter__0[0]),
        .O(\enableCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \enableCounter[1]_i_1 
       (.I0(enableCounter__0[1]),
        .I1(enableCounter__0[0]),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\enableCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \enableCounter[2]_i_1 
       (.I0(enableCounter__0[2]),
        .I1(enableCounter__0[0]),
        .I2(enableCounter__0[1]),
        .I3(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\enableCounter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h00006AAA)) 
    \enableCounter[3]_i_2 
       (.I0(enableCounter__0[3]),
        .I1(enableCounter__0[2]),
        .I2(enableCounter__0[1]),
        .I3(enableCounter__0[0]),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .O(\enableCounter[3]_i_2_n_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(enableCounter),
        .CLR(reset_IBUF),
        .D(\enableCounter[0]_i_1_n_0 ),
        .Q(enableCounter__0[0]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(enableCounter),
        .CLR(reset_IBUF),
        .D(\enableCounter[1]_i_1_n_0 ),
        .Q(enableCounter__0[1]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(enableCounter),
        .CLR(reset_IBUF),
        .D(\enableCounter[2]_i_1_n_0 ),
        .Q(enableCounter__0[2]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(enableCounter),
        .CLR(reset_IBUF),
        .D(\enableCounter[3]_i_2_n_0 ),
        .Q(enableCounter__0[3]));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  FDCE #(
    .INIT(1'b0)) 
    switchEnable_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(baud_controller_tx_inst_n_1),
        .Q(switchEnable));
  LUT2 #(
    .INIT(4'h6)) 
    \writeCounter[0]_i_1 
       (.I0(writeCounter),
        .I1(\writeCounter_reg_n_0_[0] ),
        .O(\writeCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \writeCounter[1]_i_1 
       (.I0(\writeCounter_reg_n_0_[0] ),
        .I1(writeCounter),
        .I2(\writeCounter_reg_n_0_[1] ),
        .O(\writeCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \writeCounter[2]_i_1 
       (.I0(\writeCounter_reg_n_0_[0] ),
        .I1(\writeCounter_reg_n_0_[1] ),
        .I2(writeCounter),
        .I3(\writeCounter_reg_n_0_[2] ),
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
