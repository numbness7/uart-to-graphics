module gPIO_IO_1BIT(pin1, led0);
input wire pin1;
output wire led0;

assign led0 = ~pin1;

	
endmodule