// Print positional hex values of pixels
module VGAInterfaceTB();


	parameter BITS = 10;
	parameter V_COUNT = 480;
	

	


	reg clk_50mhz, clear;
	reg [2:0] swc = 3'b001; // BLUE
	reg en;
	wire hs;
	wire vs;

	reg pre_vs = 1'b0;
	reg pre_hs = 1'b0;
	reg hs_fall = 1'b0;
	reg vs_fall = 1'b0;
	reg hs_rise = 1'b0;
	reg vs_rise = 1'b0;
	wire [7:0] vga_red;
	wire [7:0] vga_green;
	wire [7:0] vga_blue;
   wire [2:0] rgb = {vga_red[0],vga_green[0],vga_blue[0]};
	
	
	
    

    VGAInterface vGAIInst(.clk_50mhz(clk_50mhz),.clear(clear),.en(en),.hs(hs),.vs(vs),.vga_red(vga_red),.vga_green(vga_green),.vga_blue(vga_blue));
    
    wire [BITS-1:0] h_count = vGAIInst.VGACInst.h_count;
    wire [BITS-1:0] v_count = vGAIInst.VGACInst.v_count;

    localparam PERIOD = 32'd2;
    initial clk_50mhz = 1'b0;
    initial forever #(PERIOD/2) clk_50mhz = ~clk_50mhz;
    
    integer tick;
	 integer row_count;

	 reg [3:0] hex_value;
	integer hex_index;
    
	task step;
        begin
            #(PERIOD/2);
        end
	endtask
    
    task stepN;
        input integer n;
        integer i;
        begin
            for( i = 0; i < n; i = i + 1 ) begin
                step();
            end
        end
       endtask
    


	 

    initial begin
        en = 1'b1;
        clear = 1'b1;
		  #PERIOD;
		  clear = 1'b0;
		  row_count = 0;

			$write("ST");
        for ( tick = 0; tick < 100000000 /* Display screen */; tick = tick + 1 ) begin
		  

					
					if ( (vs_fall) || (hs_fall)) begin
						row_count = row_count + 1;
						$display("");
					end
					if (hs_rise) begin  $write("HR"); end
					if (vs_rise) begin  $write("VR"); end
					if (hs_fall) begin  $write("HF"); end
					if (vs_fall) begin  $write("VF"); end
					pre_vs = vs;
					pre_hs = hs;

					hs_rise = 1'b0;
					hs_fall = 1'b0;
					vs_rise = 1'b0;
					vs_fall = 1'b0;
					
					for(hex_index = 3; hex_index >= 0; hex_index = hex_index - 1) begin
						stepN(4);
						hex_value[hex_index] = rgb[0];
						if ( hs & ~pre_hs) hs_rise = 1'b1;
						if (~hs &  pre_hs) hs_fall = 1'b1;
						if ( vs & ~pre_vs) vs_rise = 1'b1;
						if (~vs &  pre_vs) vs_fall = 1'b1;
					end
					
					$write("%01h",hex_value);
					

					

						
					
					
					
					
						
					
        end
    end


    
    
endmodule
