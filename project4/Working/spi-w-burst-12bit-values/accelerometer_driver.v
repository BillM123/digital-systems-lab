// Top module for accelerometer driver //
// TODO: add your modules instantiations here //
// TODO: add SPI communication ports here //

module accelerometer_driver (clk, reset, MISO, TxD, MOSI, SCLK, CS);

input clk, reset;
input MISO;

output TxD;
output MOSI, SCLK, CS;

wire data_ready;

wire [7:0] ascii_X1, ascii_X2, ascii_X3, ascii_X4, ascii_X5, ascii_X6;
wire [7:0] ascii_Y1, ascii_Y2, ascii_Y3, ascii_Y4, ascii_Y5, ascii_Y6;
wire [7:0] ascii_Z1, ascii_Z2, ascii_Z3, ascii_Z4, ascii_Z5, ascii_Z6;
wire [7:0] ascii_T1, ascii_T2, ascii_T3, ascii_T4, ascii_T5, ascii_T6;
wire is_negative_X, is_negative_Y, is_negative_Z, is_negative_T;

wire data_ready_for_printing;


uart_transmitter_data_control uart_transmitter_data_control_inst(.clk(clk), .reset(reset), .TxD(TxD), .start_transmission(1'b1), .data_ready_for_printing(data_ready_for_printing),
.ascii_X1(ascii_X1), .ascii_X2(ascii_X2), .ascii_X3(ascii_X3), .ascii_X4(ascii_X4), .ascii_X5(ascii_X5), .ascii_X6(ascii_X6),
.ascii_Y1(ascii_Y1), .ascii_Y2(ascii_Y2), .ascii_Y3(ascii_Y3), .ascii_Y4(ascii_Y4), .ascii_Y5(ascii_Y5), .ascii_Y6(ascii_Y6),
.ascii_Z1(ascii_Z1), .ascii_Z2(ascii_Z2), .ascii_Z3(ascii_Z3), .ascii_Z4(ascii_Z4), .ascii_Z5(ascii_Z5), .ascii_Z6(ascii_Z6),
.ascii_T1(ascii_T1), .ascii_T2(ascii_T2), .ascii_T3(ascii_T3), .ascii_T4(ascii_T4), .ascii_T5(ascii_T5), .ascii_T6(ascii_T6),
.is_negative_X(is_negative_X), .is_negative_Y(is_negative_Y), .is_negative_Z(is_negative_Z), .is_negative_T(is_negative_T)
);


// // Replace the following with your modules //
// demo demo_inst(.clk(clk), .reset(reset), .data_ready_for_printing(data_ready_for_printing), 
// .ascii_X1(ascii_X1), .ascii_X2(ascii_X2), .ascii_X3(ascii_X3), .ascii_X4(ascii_X4),
// .ascii_Y1(ascii_Y1), .ascii_Y2(ascii_Y2), .ascii_Y3(ascii_Y3), .ascii_Y4(ascii_Y4),
// .ascii_Z1(ascii_Z1), .ascii_Z2(ascii_Z2), .ascii_Z3(ascii_Z3), .ascii_Z4(ascii_Z4),
// .ascii_T1(ascii_T1), .ascii_T2(ascii_T2), .ascii_T3(ascii_T3), .ascii_T4(ascii_T4), .ascii_T5(ascii_T5), .ascii_T6(ascii_T6),
// .is_negative_X(is_negative_X), .is_negative_Y(is_negative_Y), .is_negative_Z(is_negative_Z), .is_negative_T(is_negative_T)
// );

spi_driver spi_driver_inst(
    .clk(clk), .reset(reset), .MISO(MISO),
    .data_ready_for_printing(data_ready_for_printing),
    .ascii_X1(ascii_X1), .ascii_X2(ascii_X2), .ascii_X3(ascii_X3), .ascii_X4(ascii_X4), .ascii_X5(ascii_X5), .ascii_X6(ascii_X6),
    .ascii_Y1(ascii_Y1), .ascii_Y2(ascii_Y2), .ascii_Y3(ascii_Y3), .ascii_Y4(ascii_Y4), .ascii_Y5(ascii_Y5), .ascii_Y6(ascii_Y6),
    .ascii_Z1(ascii_Z1), .ascii_Z2(ascii_Z2), .ascii_Z3(ascii_Z3), .ascii_Z4(ascii_Z4), .ascii_Z5(ascii_Z5), .ascii_Z6(ascii_Z6),
    .ascii_T1(ascii_T1), .ascii_T2(ascii_T2), .ascii_T3(ascii_T3), .ascii_T4(ascii_T4), .ascii_T5(ascii_T5), .ascii_T6(ascii_T6),
    .is_negative_X(is_negative_X), .is_negative_Y(is_negative_Y), .is_negative_Z(is_negative_Z), .is_negative_T(is_negative_T),
    .MOSI(MOSI), .SCLK(SCLK), .CS(CS)
);



endmodule
