// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
// Date        : Wed Nov  6 16:15:54 2024
// Host        : master0 running 64-bit unknown
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               /home/billm123/digsys-project-2/PartC/lab_project_2_partA.sim/sim_1/synth/timing/xsim/uart_receiver_tb_time_synth.v
// Design      : uart_receiver
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module baud_controller
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
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \counter[0]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[10]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[10]),
        .O(p_0_in[10]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[11]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[11]),
        .O(p_0_in[11]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[12]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[12]),
        .O(p_0_in[12]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[13]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[13]),
        .O(p_0_in[13]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[14]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[14]),
        .O(p_0_in[14]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[1]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[1]),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[2]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[3]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[4]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[4]),
        .O(p_0_in[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[5]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[5]),
        .O(p_0_in[5]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[6]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[7]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[7]),
        .O(p_0_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[8]_i_1 
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .I2(counter0[8]),
        .O(p_0_in[8]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h20)) 
    \counter[9]_i_1 
       (.I0(Rx_EN_IBUF),
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
       (.I0(Rx_sample_ENABLE),
        .I1(Q),
        .O(E));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h8)) 
    sample_ENABLE_i_1
       (.I0(Rx_EN_IBUF),
        .I1(counter1_carry__0_n_3),
        .O(sample_ENABLE_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    sample_ENABLE_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(sample_ENABLE_i_1_n_0),
        .Q(Rx_sample_ENABLE));
  LUT5 #(
    .INIT(32'h08000000)) 
    switchEnable_i_1
       (.I0(switchEnable_reg[1]),
        .I1(switchEnable_reg[0]),
        .I2(switchEnable_reg[3]),
        .I3(switchEnable_reg[2]),
        .I4(Rx_sample_ENABLE),
        .O(switchEnable0));
endmodule

(* DATA = "3'b010" *) (* FERROR = "3'b111" *) (* IDLE = "3'b000" *) 
(* PARITY = "3'b011" *) (* PERROR = "3'b110" *) (* START = "3'b001" *) 
(* STOP = "3'b100" *) (* VALID = "3'b101" *) 
(* NotValidForBitStream *)
module uart_receiver
   (reset,
    clk,
    Rx_DATA,
    baud_select,
    Rx_EN,
    RxD,
    Rx_FERROR,
    Rx_PERROR,
    Rx_VALID);
  input reset;
  input clk;
  output [7:0]Rx_DATA;
  input [2:0]baud_select;
  input Rx_EN;
  input RxD;
  output Rx_FERROR;
  output Rx_PERROR;
  output Rx_VALID;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[0]_i_2_n_0 ;
  wire \FSM_onehot_state[1]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[5]_i_1_n_0 ;
  wire \FSM_onehot_state[6]_i_1_n_0 ;
  wire \FSM_onehot_state[7]_i_1_n_0 ;
  wire \FSM_onehot_state_reg_n_0_[4] ;
  wire RxD;
  wire RxD_IBUF;
  wire [7:0]Rx_DATA;
  wire \Rx_DATA[0]_i_1_n_0 ;
  wire \Rx_DATA[1]_i_1_n_0 ;
  wire \Rx_DATA[2]_i_1_n_0 ;
  wire \Rx_DATA[3]_i_1_n_0 ;
  wire \Rx_DATA[4]_i_1_n_0 ;
  wire \Rx_DATA[4]_i_2_n_0 ;
  wire \Rx_DATA[5]_i_1_n_0 ;
  wire \Rx_DATA[5]_i_2_n_0 ;
  wire \Rx_DATA[6]_i_1_n_0 ;
  wire \Rx_DATA[6]_i_2_n_0 ;
  wire \Rx_DATA[7]_i_1_n_0 ;
  wire \Rx_DATA[7]_i_2_n_0 ;
  wire [7:0]Rx_DATA_OBUF;
  wire Rx_DATA_i;
  wire Rx_EN;
  wire Rx_EN_IBUF;
  wire Rx_FERROR;
  wire Rx_FERROR_OBUF;
  wire Rx_FERROR_i;
  wire Rx_FERROR_i_1_n_0;
  wire Rx_PERROR;
  wire Rx_PERROR_OBUF;
  wire Rx_PERROR_i;
  wire Rx_PERROR_i_1_n_0;
  wire Rx_VALID;
  wire Rx_VALID_OBUF;
  wire Rx_VALID_i;
  wire Rx_VALID_i_1_n_0;
  wire baud_controller_rx_inst_n_0;
  wire [2:0]baud_select;
  wire [2:0]baud_select_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire \enableCounter[0]_i_1_n_0 ;
  wire \enableCounter[1]_i_1_n_0 ;
  wire \enableCounter[2]_i_1_n_0 ;
  wire \enableCounter[3]_i_2_n_0 ;
  wire [3:0]enableCounter_reg;
  wire idle_i;
  wire [2:0]p_1_in;
  wire parity;
  wire parity_i;
  wire parity_i_1_n_0;
  wire parity_i_2_n_0;
  wire parity_i_3_n_0;
  wire reset;
  wire reset_IBUF;
  wire start_i;
  wire switchEnable;
  wire switchEnable0;
  wire [2:0]writeCounter;
  wire \writeCounter[0]_i_1_n_0 ;
  wire \writeCounter[1]_i_1_n_0 ;
  wire \writeCounter[2]_i_1_n_0 ;

initial begin
 $sdf_annotate("uart_receiver_tb_time_synth.sdf",,,,"tool_control");
end
  LUT5 #(
    .INIT(32'hFFFFF020)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(Rx_PERROR_i),
        .I1(RxD_IBUF),
        .I2(switchEnable),
        .I3(Rx_FERROR_i),
        .I4(\FSM_onehot_state[0]_i_2_n_0 ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h8FFF8888)) 
    \FSM_onehot_state[0]_i_2 
       (.I0(switchEnable),
        .I1(Rx_VALID_i),
        .I2(RxD_IBUF),
        .I3(Rx_EN_IBUF),
        .I4(idle_i),
        .O(\FSM_onehot_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80FF8080)) 
    \FSM_onehot_state[1]_i_1 
       (.I0(RxD_IBUF),
        .I1(Rx_EN_IBUF),
        .I2(idle_i),
        .I3(switchEnable),
        .I4(start_i),
        .O(\FSM_onehot_state[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hBFFFFFFF88888888)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(start_i),
        .I1(switchEnable),
        .I2(writeCounter[2]),
        .I3(writeCounter[0]),
        .I4(writeCounter[1]),
        .I5(Rx_DATA_i),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h8000FFFF80000000)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(writeCounter[2]),
        .I1(writeCounter[0]),
        .I2(writeCounter[1]),
        .I3(Rx_DATA_i),
        .I4(switchEnable),
        .I5(parity_i),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h4F40)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(parity),
        .I1(parity_i),
        .I2(switchEnable),
        .I3(\FSM_onehot_state_reg_n_0_[4] ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h8F80)) 
    \FSM_onehot_state[5]_i_1 
       (.I0(RxD_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(switchEnable),
        .I3(Rx_VALID_i),
        .O(\FSM_onehot_state[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'h4F40)) 
    \FSM_onehot_state[6]_i_1 
       (.I0(RxD_IBUF),
        .I1(\FSM_onehot_state_reg_n_0_[4] ),
        .I2(switchEnable),
        .I3(Rx_FERROR_i),
        .O(\FSM_onehot_state[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFF8F8080)) 
    \FSM_onehot_state[7]_i_1 
       (.I0(parity),
        .I1(parity_i),
        .I2(switchEnable),
        .I3(RxD_IBUF),
        .I4(Rx_PERROR_i),
        .O(\FSM_onehot_state[7]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .PRE(reset_IBUF),
        .Q(idle_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[1]_i_1_n_0 ),
        .Q(start_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(Rx_DATA_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(parity_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[4] ));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[5]_i_1_n_0 ),
        .Q(Rx_VALID_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[6]_i_1_n_0 ),
        .Q(Rx_FERROR_i));
  (* FSM_ENCODED_STATES = "START:00000010,DATA:00000100,PARITY:00001000,STOP:00010000,VALID:00100000,FERROR:01000000,IDLE:00000001,PERROR:10000000" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\FSM_onehot_state[7]_i_1_n_0 ),
        .Q(Rx_PERROR_i));
  IBUF RxD_IBUF_inst
       (.I(RxD),
        .O(RxD_IBUF));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA[0]_i_1 
       (.I0(RxD_IBUF),
        .I1(p_1_in[0]),
        .I2(Rx_DATA_i),
        .I3(start_i),
        .I4(Rx_DATA_OBUF[0]),
        .O(\Rx_DATA[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \Rx_DATA[0]_i_2 
       (.I0(writeCounter[2]),
        .I1(writeCounter[0]),
        .I2(writeCounter[1]),
        .O(p_1_in[0]));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA[1]_i_1 
       (.I0(RxD_IBUF),
        .I1(p_1_in[1]),
        .I2(Rx_DATA_i),
        .I3(start_i),
        .I4(Rx_DATA_OBUF[1]),
        .O(\Rx_DATA[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \Rx_DATA[1]_i_2 
       (.I0(writeCounter[2]),
        .I1(writeCounter[0]),
        .I2(writeCounter[1]),
        .O(p_1_in[1]));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA[2]_i_1 
       (.I0(RxD_IBUF),
        .I1(p_1_in[2]),
        .I2(Rx_DATA_i),
        .I3(start_i),
        .I4(Rx_DATA_OBUF[2]),
        .O(\Rx_DATA[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h04)) 
    \Rx_DATA[2]_i_2 
       (.I0(writeCounter[2]),
        .I1(writeCounter[1]),
        .I2(writeCounter[0]),
        .O(p_1_in[2]));
  LUT6 #(
    .INIT(64'h0200FEFF02000200)) 
    \Rx_DATA[3]_i_1 
       (.I0(RxD_IBUF),
        .I1(\Rx_DATA[7]_i_2_n_0 ),
        .I2(writeCounter[2]),
        .I3(Rx_DATA_i),
        .I4(start_i),
        .I5(Rx_DATA_OBUF[3]),
        .O(\Rx_DATA[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA[4]_i_1 
       (.I0(RxD_IBUF),
        .I1(\Rx_DATA[4]_i_2_n_0 ),
        .I2(Rx_DATA_i),
        .I3(start_i),
        .I4(Rx_DATA_OBUF[4]),
        .O(\Rx_DATA[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h02)) 
    \Rx_DATA[4]_i_2 
       (.I0(writeCounter[2]),
        .I1(writeCounter[0]),
        .I2(writeCounter[1]),
        .O(\Rx_DATA[4]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA[5]_i_1 
       (.I0(RxD_IBUF),
        .I1(\Rx_DATA[5]_i_2_n_0 ),
        .I2(Rx_DATA_i),
        .I3(start_i),
        .I4(Rx_DATA_OBUF[5]),
        .O(\Rx_DATA[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \Rx_DATA[5]_i_2 
       (.I0(writeCounter[2]),
        .I1(writeCounter[0]),
        .I2(writeCounter[1]),
        .O(\Rx_DATA[5]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80BF8080)) 
    \Rx_DATA[6]_i_1 
       (.I0(RxD_IBUF),
        .I1(\Rx_DATA[6]_i_2_n_0 ),
        .I2(Rx_DATA_i),
        .I3(start_i),
        .I4(Rx_DATA_OBUF[6]),
        .O(\Rx_DATA[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \Rx_DATA[6]_i_2 
       (.I0(writeCounter[2]),
        .I1(writeCounter[1]),
        .I2(writeCounter[0]),
        .O(\Rx_DATA[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h2000EFFF20002000)) 
    \Rx_DATA[7]_i_1 
       (.I0(RxD_IBUF),
        .I1(\Rx_DATA[7]_i_2_n_0 ),
        .I2(writeCounter[2]),
        .I3(Rx_DATA_i),
        .I4(start_i),
        .I5(Rx_DATA_OBUF[7]),
        .O(\Rx_DATA[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \Rx_DATA[7]_i_2 
       (.I0(writeCounter[1]),
        .I1(writeCounter[0]),
        .O(\Rx_DATA[7]_i_2_n_0 ));
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
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[0]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[1]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[2]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[3]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[4]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[5]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[6]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \Rx_DATA_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(\Rx_DATA[7]_i_1_n_0 ),
        .Q(Rx_DATA_OBUF[7]));
  IBUF Rx_EN_IBUF_inst
       (.I(Rx_EN),
        .O(Rx_EN_IBUF));
  OBUF Rx_FERROR_OBUF_inst
       (.I(Rx_FERROR_OBUF),
        .O(Rx_FERROR));
  LUT2 #(
    .INIT(4'hE)) 
    Rx_FERROR_i_1
       (.I0(start_i),
        .I1(Rx_FERROR_i),
        .O(Rx_FERROR_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Rx_FERROR_reg
       (.C(clk_IBUF_BUFG),
        .CE(Rx_FERROR_i_1_n_0),
        .CLR(reset_IBUF),
        .D(Rx_FERROR_i),
        .Q(Rx_FERROR_OBUF));
  OBUF Rx_PERROR_OBUF_inst
       (.I(Rx_PERROR_OBUF),
        .O(Rx_PERROR));
  LUT2 #(
    .INIT(4'hE)) 
    Rx_PERROR_i_1
       (.I0(start_i),
        .I1(Rx_PERROR_i),
        .O(Rx_PERROR_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Rx_PERROR_reg
       (.C(clk_IBUF_BUFG),
        .CE(Rx_PERROR_i_1_n_0),
        .CLR(reset_IBUF),
        .D(Rx_PERROR_i),
        .Q(Rx_PERROR_OBUF));
  OBUF Rx_VALID_OBUF_inst
       (.I(Rx_VALID_OBUF),
        .O(Rx_VALID));
  LUT2 #(
    .INIT(4'hE)) 
    Rx_VALID_i_1
       (.I0(start_i),
        .I1(Rx_VALID_i),
        .O(Rx_VALID_i_1_n_0));
  FDCE #(
    .INIT(1'b0)) 
    Rx_VALID_reg
       (.C(clk_IBUF_BUFG),
        .CE(Rx_VALID_i_1_n_0),
        .CLR(reset_IBUF),
        .D(Rx_VALID_i),
        .Q(Rx_VALID_OBUF));
  baud_controller baud_controller_rx_inst
       (.E(baud_controller_rx_inst_n_0),
        .Q(idle_i),
        .Rx_EN_IBUF(Rx_EN_IBUF),
        .baud_select_IBUF(baud_select_IBUF),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF),
        .switchEnable0(switchEnable0),
        .switchEnable_reg(enableCounter_reg));
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
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \enableCounter[0]_i_1 
       (.I0(enableCounter_reg[0]),
        .I1(idle_i),
        .O(\enableCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT3 #(
    .INIT(8'h06)) 
    \enableCounter[1]_i_1 
       (.I0(enableCounter_reg[1]),
        .I1(enableCounter_reg[0]),
        .I2(idle_i),
        .O(\enableCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h006A)) 
    \enableCounter[2]_i_1 
       (.I0(enableCounter_reg[2]),
        .I1(enableCounter_reg[1]),
        .I2(enableCounter_reg[0]),
        .I3(idle_i),
        .O(\enableCounter[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
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
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[0]_i_1_n_0 ),
        .Q(enableCounter_reg[0]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[1]_i_1_n_0 ),
        .Q(enableCounter_reg[1]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[2]_i_1_n_0 ),
        .Q(enableCounter_reg[2]));
  FDCE #(
    .INIT(1'b0)) 
    \enableCounter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(baud_controller_rx_inst_n_0),
        .CLR(reset_IBUF),
        .D(\enableCounter[3]_i_2_n_0 ),
        .Q(enableCounter_reg[3]));
  LUT5 #(
    .INIT(32'h96FF9600)) 
    parity_i_1
       (.I0(parity_i_2_n_0),
        .I1(parity_i_3_n_0),
        .I2(RxD_IBUF),
        .I3(parity_i),
        .I4(parity),
        .O(parity_i_1_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    parity_i_2
       (.I0(Rx_DATA_OBUF[2]),
        .I1(Rx_DATA_OBUF[3]),
        .I2(Rx_DATA_OBUF[0]),
        .I3(Rx_DATA_OBUF[1]),
        .O(parity_i_2_n_0));
  LUT4 #(
    .INIT(16'h6996)) 
    parity_i_3
       (.I0(Rx_DATA_OBUF[6]),
        .I1(Rx_DATA_OBUF[7]),
        .I2(Rx_DATA_OBUF[4]),
        .I3(Rx_DATA_OBUF[5]),
        .O(parity_i_3_n_0));
  FDCE #(
    .INIT(1'b0)) 
    parity_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(parity_i_1_n_0),
        .Q(parity));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
  FDCE #(
    .INIT(1'b0)) 
    switchEnable_reg
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .CLR(reset_IBUF),
        .D(switchEnable0),
        .Q(switchEnable));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \writeCounter[0]_i_1 
       (.I0(switchEnable),
        .I1(Rx_DATA_i),
        .I2(writeCounter[0]),
        .O(\writeCounter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \writeCounter[1]_i_1 
       (.I0(writeCounter[0]),
        .I1(Rx_DATA_i),
        .I2(switchEnable),
        .I3(writeCounter[1]),
        .O(\writeCounter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \writeCounter[2]_i_1 
       (.I0(writeCounter[0]),
        .I1(writeCounter[1]),
        .I2(Rx_DATA_i),
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
