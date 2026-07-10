module gpio_1bit(pin1, led0);
input wire pin1;
output wire led0;

assign led0 = ~pin1;

	
endmodule