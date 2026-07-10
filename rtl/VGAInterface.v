
module VGAInterface(clk_50mhz,clear,en,hs,vs,vga_red,vga_green,vga_blue,hs_led,vs_led,rgb,vga_clock,vga_blank_n,vga_sync_n,uart_rxd,uart_txd);
    parameter reg [31:0] BITS = 10;
	 parameter reg [3:0] PAYLOAD_BITS = 8;


    input clk_50mhz, clear;
    reg [2:0] swc = 3'b0;
    input en;
	 input wire       uart_rxd     ; // UART Recieve pin.
	 output wire      uart_txd     ;
    output wire hs;
    output wire vs;
    output wire hs_led;
    output wire vs_led;
    output wire [7:0] vga_red;
    output wire [7:0] vga_green;
    output wire [7:0] vga_blue;
	 output wire vga_clock;
	 output wire vga_blank_n;
	 output wire vga_sync_n;
	 
	 assign vga_sync_n = 1'b0;

    assign hs_led = hs;
    assign vs_led = vs;

	assign vga_clock = clk_25mHz;
	assign vga_blank_n = bright; // off-active-low

    reg clk_25mHz = 1'b0;

    output wire [2:0] rgb;

	 
    wire [2:0] pixel_data;
    wire h_sync;
    wire v_sync;
    wire bright;
    wire [BITS-1:0] h_count;
    wire [BITS-1:0] v_count;

    assign hs = h_sync;
    assign vs = v_sync;
    assign pixel_data = swc;
    assign vga_red = {8{rgb[2]}};
    assign vga_green = {8{rgb[1]}};
    assign vga_blue = {8{rgb[0]}};
	 

    

    wire       uart_rx_break; // Did we get a BREAK message?
    wire       uart_rx_valid; // Valid data recieved and available.
    wire  [PAYLOAD_BITS-1:0] uart_rx_data;   // The recieved data.
	 
	 parameter BIT_RATE = 115_200;	 
	 parameter CLK_HZ = 50_000_000;

	uart_rx #(.PAYLOAD_BITS(PAYLOAD_BITS), .BIT_RATE(BIT_RATE), .CLK_HZ(CLK_HZ)) i_uart_rx (
		.clk(clk_50mhz)          , // Top level system clock input.
		.resetn(1'b1)       , // Asynchronous active low reset.
		.uart_rxd(uart_rxd)     , // UART Recieve pin.
		.uart_rx_en(1'b1)   , // Recieve enable
		.uart_rx_break(uart_rx_break), // Did we get a BREAK message?
		.uart_rx_valid(uart_rx_valid), // Valid data recieved and available.
		.uart_rx_data(uart_rx_data)   // The recieved data.
);
  
  wire uart_tx_en = uart_rx_valid;
  wire [PAYLOAD_BITS-1:0] uart_tx_data = uart_rx_data;
  wire uart_tx_busy;

	uart_tx #(
	.BIT_RATE(BIT_RATE),
	.PAYLOAD_BITS(PAYLOAD_BITS),
	.CLK_HZ  (CLK_HZ  )
	) i_uart_tx(
		.clk          (clk_50mhz          ),
		.resetn       (1'b1         ),
		.uart_txd     (uart_txd     ),
		.uart_tx_en   (uart_tx_en |  uart_tx_busy  ),
		.uart_tx_busy (uart_tx_busy),
		.uart_tx_data (uart_tx_data ) 
	);


    always @(posedge clk_50mhz) begin
	   if(uart_rx_valid) begin
			case(uart_rx_data)
				8'h30: swc <= 3'd0;
				8'h31: swc <= 3'd1;
				8'h32: swc <= 3'd2;
				8'h33: swc <= 3'd3;
				8'h34: swc <= 3'd4;
				8'h35: swc <= 3'd5;
				8'h36: swc <= 3'd6;
				8'h37: swc <= 3'd7;
				default: swc <= swc;
			endcase
		end
	 end

    // Choose rgb value for current pixel
    VGABitgen VGABInst(.clk(clk_50mhz),.en(clk_25mHz & en),.h_count(h_count),.v_count(v_count),
        .bright(bright),.pixel_data(pixel_data),.rgb(rgb));

    // Determine current pixel value and whether in porch
    VGAController VGACInst(.clk(clk_50mhz),.en(clk_25mHz & en), .clear(clear), .h_sync(h_sync),
        .v_sync(v_sync), .bright(bright), .h_count(h_count), .v_count(v_count));
	// Make clk_50mhz two times slower
    always @(posedge clk_50mhz) begin
					clk_25mHz = ~ clk_25mHz;		
		end
		


endmodule



module VGABitgen(clk,en,h_count,v_count,bright,pixel_data,rgb);
		parameter reg [31:0] BITS = 10;
		parameter reg [9:0]  LEFT_EDGE = 10'd200;
		parameter reg [9:0] RIGHT_EDGE = 10'd470;
		parameter reg [9:0] TOP_EDGE = 10'd400;
		parameter reg [9:0] BOTTOM_EDGE = 10'd440;
		
		 input clk,bright,en;
		 input [BITS - 1:0] h_count;
		 input [BITS - 1:0] v_count;
		 
		 input [2:0] pixel_data;
		 output reg [2:0] rgb;

		 always @(posedge clk) begin
			if(en) begin
				if (h_count > LEFT_EDGE & h_count < RIGHT_EDGE & v_count < BOTTOM_EDGE & v_count > TOP_EDGE) rgb <= {3{bright}} & pixel_data;
				else rgb <= {3{bright}} & {1'b1,~pixel_data[1:0]};
			end
		 end

endmodule


module VGAController(clk,en, clear, h_sync, v_sync, bright, h_count, v_count);

    parameter reg [31:0] BITS = 10;


    parameter reg  [BITS-1:0] H_SYNC = 10'd96;
    parameter reg  [BITS-1:0] H_BACK_PORCH = 10'd48;
    parameter reg  [BITS-1:0] H_DISPLAY_INT = 10'd640;
    parameter reg  [BITS-1:0] H_FRONT_PORCH = 10'd16;
	 localparam reg [BITS-1:0] H_TOTAL = H_SYNC + H_BACK_PORCH + H_DISPLAY_INT + H_FRONT_PORCH;

    parameter reg  [BITS-1:0] V_SYNC = 10'd2;
    parameter reg  [BITS-1:0] V_BACK_PORCH = 10'd29;
    parameter reg  [BITS-1:0] V_DISPLAY_INT = 10'd480;
    parameter reg  [BITS-1:0] V_FRONT_PORCH = 10'd10;
	 localparam reg [BITS-1:0] V_TOTAL = V_SYNC + V_BACK_PORCH + V_DISPLAY_INT + V_FRONT_PORCH;




    input clk, clear, en;

    output wire h_sync;
    output wire v_sync;

    output wire bright;
    output reg [BITS - 1:0] v_count;
    output reg [BITS - 1:0] h_count;
	 

	 
    reg [BITS - 1:0] v_count_raw = {BITS{1'b0}};
    reg [BITS - 1:0] h_count_raw = {BITS{1'b0}};

	assign h_sync = ~( (h_count_raw >= H_FRONT_PORCH) & 
				(h_count_raw < H_FRONT_PORCH + H_SYNC) );
	assign v_sync = ~( (v_count_raw >= V_DISPLAY_INT + V_FRONT_PORCH) & 
				(v_count_raw < V_DISPLAY_INT + V_FRONT_PORCH + V_SYNC) );

    assign bright = ((h_count_raw > H_TOTAL - H_DISPLAY_INT) & (h_count_raw < H_TOTAL) & (v_count_raw < V_DISPLAY_INT)); // active-high

	 always @(h_count_raw) begin
			if (h_count_raw < H_TOTAL - H_DISPLAY_INT) h_count = {BITS{1'b0}};
			else h_count = h_count_raw - (H_TOTAL - H_DISPLAY_INT);
	 end
	 
	 always @(v_count_raw) begin
		v_count = v_count_raw;
	 end
	 
    always @(posedge clk) begin
        if (clear) begin
            h_count_raw <= {BITS{1'b0}};
            v_count_raw <= {BITS{1'b0}};
        end
		 else if (en) begin
			 if ( v_count_raw >= V_TOTAL ) v_count_raw <= {BITS{1'b0}};
			 if ( h_count_raw >= H_TOTAL ) begin 
				h_count_raw <= {BITS{1'b0}}; /* go to start of line */
				v_count_raw <= v_count_raw + 10'd1; /* go to next line */
				end
			 else h_count_raw <= h_count_raw + 10'd1; /* go one pixel right */

		 end
end

endmodule
