module maq_m(input maq_m_clock,
input maq_m_reset,
input maq_m_enable1hz,
input maq_m_incremento_minuto,
output logic [3:0] maq_m_bcd_m_lsd,
output logic [2:0] maq_m_bcd_m_msd,
output logic maq_m_incremento_hora);

	always_ff @(posedge maq_m_clock)
	begin
		if(!maq_m_reset)
		begin
			//maq_m_bcd_m_lsd <= 4'd0;
			//maq_m_bcd_m_msd <= 3'd0;
			maq_m_bcd_m_lsd <= 4'd9;
			maq_m_bcd_m_msd <= 3'd5;
			maq_m_incremento_hora <=1'b0;
		end
		else
		begin
			if(maq_m_enable1hz)
			begin
				maq_m_incremento_hora <=1'b0;
				if(maq_m_incremento_minuto)
				begin
					if(maq_m_bcd_m_lsd == 4'd9)
					begin
						if(maq_m_bcd_m_msd == 3'd5)
						begin
							maq_m_incremento_hora <= 1'b1;
							maq_m_bcd_m_lsd <= 4'd0;
							maq_m_bcd_m_msd <= 3'd0;
						end
						else
						begin
							//maq_m_incremento_hora <=1'b0;
							maq_m_bcd_m_lsd <= 4'd0;
							maq_m_bcd_m_msd <= maq_m_bcd_m_msd + 3'd1;
						end
					end
					else
					begin
						//maq_m_incremento_hora <=1'b0;
						maq_m_bcd_m_lsd <= maq_m_bcd_m_lsd + 4'd1;	
					end
				end
			end
		end
	end
endmodule 