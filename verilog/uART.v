module uART_RX(
input                   clk          , // Top level system clock input.
input                   resetn       , // Asynchronous active low reset.
input                   uart_rxd     , // UART Recieve pin.
input                   uart_rx_en   , // Recieve enable
output                  uart_rx_break, // Did we get a BREAK message?
output                  uart_rx_valid, // Valid data recieved/available.
output [PAYLOAD_BITS:0] uart_rx_data   // The recieved data.
);

parameter   BIT_RATE = 9600;      // Input bit rate of the UART line.
parameter   CLK_HZ   = 100000000; // Clock frequency in hertz.
parameter   PAYLOAD_BITS    = 8;  // Number of data bits per UART packet.
parameter   STOP_BITS       = 1;  // Stop bits per UART packet.
endmodule

module uART_TX(
input                     clk         , // Top level system clock input.
input                     resetn      , // Asynchronous active low reset.
output                    uart_txd    , // UART transmit pin.
output                    uart_tx_busy, // Module busy sending previous item.
input                     uart_tx_en  , // Send the data on uart_tx_data
input  [PAYLOAD_BITS-1:0] uart_tx_data  // The data to be sent
);

parameter   BIT_RATE = 9600;      // Input bit rate of the UART line.
parameter   CLK_HZ   = 100000000; // Clock frequency in hertz.
parameter   PAYLOAD_BITS    = 8;  // Number of data bits per UART packet.
parameter   STOP_BITS       = 1;  // Stop bits per UART packet.
endmodule