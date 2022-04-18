module maq_h(input maq_h_clock,
input maq_h_reset,
input maq_h_enable1hz,
input maq_h_incremento_hora,
output logic [3:0] maq_h_bcd_h_lsd,
output logic [1:0] maq_h_bcd_h_msd);

	always_ff @(posedge maq_h_clock)
	begin
		if(!maq_h_reset)
		begin
			maq_h_bcd_h_lsd <= 4'd0;
			maq_h_bcd_h_msd <= 2'd0;
		end		
		else
		begin
			if(maq_h_enable1hz)
			begin
				if(maq_h_incremento_hora)
				begin
					if(maq_h_bcd_h_msd == 2'd2)
					begin
						if(maq_h_bcd_h_lsd == 4'd3)
						begin
							maq_h_bcd_h_lsd <= 4'd0;
							maq_h_bcd_h_msd <= 2'd0;
						end
						else
						begin 
							maq_h_bcd_h_lsd <= maq_h_bcd_h_lsd + 4'd1;
						end
					end
					else 
					begin 
						if(maq_h_bcd_h_lsd == 4'd9)
						begin
							maq_h_bcd_h_lsd <= 4'd0;
							maq_h_bcd_h_msd <= maq_h_bcd_h_msd +2'd1;
							
						end
						else
						begin
							maq_h_bcd_h_lsd <= maq_h_bcd_h_lsd + 4'd1;
						end
					end
				end
			end
		end
	end
endmodule
