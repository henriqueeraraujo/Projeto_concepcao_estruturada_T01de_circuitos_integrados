module relogio_digital (input clock,
input reset,
output logic [6:0] s_lsd, 
output logic [6:0] s_msd, 
output logic [6:0] m_lsd, 
output logic [6:0] m_msd, 
output logic [6:0] h_lsd, 
output logic [6:0] h_msd,
output	logic [3:0] bcd_s_lsd,
output	logic [2:0] bcd_s_msd,
output	logic [3:0] bcd_m_lsd,
output	logic [2:0] bcd_m_msd,
output	logic [3:0] bcd_h_lsd,
output	logic [1:0] bcd_h_msd
);

	logic enable1hz;
	/*logic [3:0] bcd_s_lsd;
	logic [2:0] bcd_s_msd;
	logic [3:0] bcd_m_lsd;
	logic [2:0] bcd_m_msd;
	logic [3:0] bcd_h_lsd;
	logic [1:0] bcd_h_msd;*/
	logic incremento_minuto;
	logic incremento_hora;
	

	

	
	enable_1hz meuhabilitador(.enable_clock(clock), .enable_reset(reset), .enable_pulseout(enable1hz));
	maq_s SEGUNDOS(.maq_s_clock(clock), .maq_s_reset(reset), .maq_s_enable1hz(enable1hz), .maq_s_bcd_s_lsd(bcd_s_lsd), .maq_s_bcd_s_msd(bcd_s_msd), .maq_s_incremento_minuto(incremento_minuto));
	maq_m MINUTOS(.maq_m_clock(clock), .maq_m_reset(reset), .maq_m_enable1hz(enable1hz),.maq_m_incremento_minuto(incremento_minuto), .maq_m_bcd_m_lsd(bcd_m_lsd), .maq_m_bcd_m_msd(bcd_m_msd), .maq_m_incremento_hora(incremento_hora));
	maq_h HORAS(.maq_h_clock(clock), .maq_h_reset(reset), .maq_h_enable1hz(enable1hz), .maq_h_incremento_hora(incremento_hora), .maq_h_bcd_h_lsd(bcd_h_lsd), .maq_h_bcd_h_msd(bcd_h_msd));

	bcd_7seg SEGUNDOS_LSD(.bcd_bcd_in(bcd_s_lsd), .bcd_display_out(s_lsd));
	bcd_7seg SEGUNDOS_MSD(.bcd_bcd_in(bcd_s_msd), .bcd_display_out(s_msd));
	
	bcd_7seg MINUTOS_LSD(.bcd_bcd_in(bcd_m_lsd), .bcd_display_out(m_lsd));
	bcd_7seg MINUTOS_MSD(.bcd_bcd_in(bcd_m_msd), .bcd_display_out(m_msd));
	
	bcd_7seg HORAS_LSD(.bcd_bcd_in(bcd_h_lsd), .bcd_display_out(h_lsd));
	bcd_7seg HORAS_MSD(.bcd_bcd_in(bcd_h_msd), .bcd_display_out(h_msd));
	
	
	
endmodule 