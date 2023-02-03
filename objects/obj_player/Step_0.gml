/// @description Mobilidade e ações

// --------- MOVIMENTO ------------ //
f_movimento();

// ----------- ATAQUES --------------//
//Corpo a corpo
f_ataca();
//A distancia
f_atira();

// ---------- HABILIDADES ------------//
f_corrida();

// ---------- STATUS ------------//
f_danificado();

if(vida_atual <= 0)
{
	global.abates_consecutivos = 0
	scr_salva_contagem_abates()
	game_restart();
}