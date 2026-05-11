module uart_transmitter(
    input reset,
    input clk,
    input [8:1] Tx_DATA,
    input [2:0] baud_select,
    input Tx_EN, // Activator signal (data loaded)
    input Tx_WR, // Write signal to load data
    output reg TxD, // Data to be sent
    output reg Tx_BUSY // Raise when sending data
);

    // State definitions
    typedef enum logic [2:0] {
        IDLE,
        START,
        DATA,
        STOP
    } state_t;

    state_t current_state, next_state;
    reg [3:0] bit_count; // Counter for bits transmitted
    reg [15:0] baud_counter; // Baud rate counter
    reg [15:0] baud_rate; // Value to determine baud rate based on baud_select
    reg [8:0] tx_shift_reg; // Shift register for transmitting data

    // Baud rate selection based on baud_select
    always_comb begin
        case (baud_select)
            3'b000: baud_rate = 16'd104; // Example for 9600 baud
            3'b001: baud_rate = 16'd52;  // Example for 19200 baud
            3'b010: baud_rate = 16'd26;  // Example for 38400 baud
            // Add more baud rates as needed
            default: baud_rate = 16'd104;
        endcase
    end

    // State machine
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            TxD <= 1; // Idle state for TxD
            Tx_BUSY <= 0;
            bit_count <= 0;
            baud_counter <= 0;
        end else begin
            case (current_state)
                IDLE: begin
                    Tx_BUSY <= 0;
                    if (Tx_EN && Tx_WR) begin
                        tx_shift_reg <= {1'b1, Tx_DATA}; // Load data and append stop bit
                        current_state <= START;
                        Tx_BUSY <= 1;
                        bit_count <= 0;
                    end
                end

                START: begin
                    TxD <= 0; // Start bit
                    if (baud_counter < baud_rate) begin
                        baud_counter <= baud_counter + 1;
                    end else begin
                        baud_counter <= 0;
                        current_state <= DATA;
                    end
                end

                DATA: begin
                    TxD <= tx_shift_reg[bit_count]; // Send data bit
                    if (baud_counter < baud_rate) begin
                        baud_counter <= baud_counter + 1;
                    end else begin
                        baud_counter <= 0;
                        if (bit_count < 8) begin
                            bit_count <= bit_count + 1;
                        end else begin
                            current_state <= STOP;
                        end
                    end
                end

                STOP: begin
                    TxD <= 1; // Stop bit
                    if (baud_counter < baud_rate) begin
                        baud_counter <= baud_counter + 1;
                    end else begin
                        baud_counter <= 0;
                        current_state <= IDLE; // Go back to idle
                    end
                end
            endcase
        end
    end
endmodule
