module maq_s (input maq_s_clock, 
input maq_s_reset,
input maq_s_enable1hz,
output logic [3:0] maq_s_bcd_s_lsd,
output logic [2:0] maq_s_bcd_s_msd,
output logic maq_s_incremento_minuto);
	
	always_ff @(posedge maq_s_clock)
	begin	
		if(!maq_s_reset)
			begin
				maq_s_bcd_s_lsd <= 4'd0;
				maq_s_bcd_s_msd <= 3'd0;
				maq_s_incremento_minuto <= 1'b0;
			end
		else
			begin
				if(maq_s_enable1hz)
					begin
						if(maq_s_bcd_s_lsd == 4'd9)
							begin
								if(maq_s_bcd_s_msd == 3'd5)
								begin
									maq_s_incremento_minuto <= 1'b1;
									maq_s_bcd_s_lsd <= 4'd0;
									maq_s_bcd_s_msd <= 3'd0;
								end
								else
									begin
										maq_s_incremento_minuto <= 1'b0;
										maq_s_bcd_s_lsd <= 4'd0;
										maq_s_bcd_s_msd <= maq_s_bcd_s_msd + 3'd1;
									end
							end
						else
							begin
								maq_s_incremento_minuto <= 1'b0;
								maq_s_bcd_s_lsd <= maq_s_bcd_s_lsd + 4'd1;
							end
					end
			end
	end
endmodule