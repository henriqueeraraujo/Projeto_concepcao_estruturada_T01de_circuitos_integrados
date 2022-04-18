module enable_1hz( input enable_clock, enable_reset, output logic enable_pulseout);
	
	logic [1:0] contador;
	
	always_ff @(posedge enable_clock)
	begin
		if(!enable_reset)
			contador <=2'd0;
		else
		begin
			if(contador==2'd1)
				contador<=2'd0;
			else
				contador <= contador + 2'd1;
		end
		
	end
	
	always_comb
	 enable_pulseout <= (contador==2'd1);
		
		
endmodule 