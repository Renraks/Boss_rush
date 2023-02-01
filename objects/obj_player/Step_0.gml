/// @description Mobilidade e ações

// --------- MOVIMENTO ------------ //
movimento();

// ----------- ATAQUES --------------//
ataca();

atira();

// ---------- HABILIDADES ------------//
corrida();

// ---------- STATUS ------------//
danificado();

if(vida <= 0)
{
	global.abates_consecutivos = 0
	scr_salva_contagem_abates()
	game_restart();
}