/// @description Variaveis de criação

// ------------- Variaveis básicas -------------- //
velocidade_base = global.grid_dados_player[# e_dados_player.velocidade, e_atributos_dados_player.valor]
velocidade_atual = velocidade_base; // Velocidade do player
vida_atual = global.grid_dados_player[# e_dados_player.vida_max, e_atributos_dados_player.valor]; // Vida do player
ivulneravel = false; // Ativa a ivulnerabilidade
tempo_ivulneravel = 0; // Checa se perdeu vida

// ------ Ataques --------//
// --- Corpo a Corpo --- //
ataque_cac_em_cooldown = false
cooldown_ataque_cac = global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.cooldown]
// --- A Distancia --- //
ataque_ad_em_cooldown = false
cooldown_ataque_ad = global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.cooldown] //Cooldowndo do tiro

// ------ Habilidades --------- //
// ---- Dash ---- //
dash_em_cooldown = false
cooldown_dash = global.grid_habilidades_player[# e_habilidades_player.dash, e_atributos_habilidades_player.cooldown] //Coldown do dash

//Variavel global para usar na UI
global.player_index = object_index

//Métodos

// ------- Movimento ----------//
function f_movimento(){
	//Variaveis de movimentação
	var _up, _down, _right, _left;
	_up = keyboard_check(ord("W"));
	_down = keyboard_check(ord("S"));
	_right = keyboard_check(ord("D"));
	_left = keyboard_check(ord("A"));
	
	//Verificando se está livre e andando
	speed = 0;
	if(place_free(x, y +(_down - _up)* velocidade)) y += (_down - _up) * velocidade;
	if(place_free(x + (_right - _left) * velocidade, y)) x += (_right - _left) * velocidade;
}

// -------- Atirando ----------//
function f_ataca()
{	
	var _ativar_ataque = mouse_button = mb_left
	if (_ativar_ataque && !ataque_cac_em_cooldown)
	{
		var _ataque = instance_create_layer(x, y, "Ataque", obj_ataque_1)
		_ataque.dano = global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.dano]
		alarm[1] = cooldown_ataque_cac
		ataque_cac_em_cooldown = true;
		audio_play_sound(snd_Punch, 1, false)
	}
}
// -------- Atirando ----------//
function f_atira()
{
	var _ativar_tiro = mouse_button = mb_right;
	if(_ativar_tiro && !ataque_ad_em_cooldown) 
	{
		var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro1_player);
		_tiro.dano = global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.dano]
		alarm[2] = cooldown_ataque_ad
		ataque_ad_em_cooldown = true;
		audio_play_sound(snd_Gun_shoot, 1, false)
	}
}

// -------- Dash ----------- //
function f_corrida()
{
	var _ativar_dash = keyboard_check_pressed(vk_space);
	if(_ativar_dash and !dash_em_cooldown)
	{
		velocidade_atual *= 6; //Velocidade do dash
		alarm[0] = global.grid_habilidades_player[# e_habilidades_player, e_atributos_habilidades_player.duracao]; //Duração do dash
		dash_em_cooldown = true;
		audio_play_sound(snd_Slide, 1, false)
	}	
}
// -------- NOVA HABILIDADE ------- //


// --------- Recebendo dano ------------ //
function f_danificado()
{
	//Se colidir com o chefe, toma 1 de dano
	var chefe = instance_place(x, y, obj_boss)
	if(chefe and !ivulneravel)
	{
		if !chefe.dando_avanco vida--;
		else vida_atual -= 2
		tempo_ivulneravel = room_speed * 3;
		ivulneravel = true;
	}
	//Se receber um ataque do chefe, toma mais dano ainda
	if place_meeting(x, y, obj_boss_ataque_cc) and !ivulneravel
	{
		vida_atual -= 2
		tempo_ivulneravel = room_speed * 3
		ivulneravel = true
	}
	var _explosao = instance_place(x, y, obj_explosao_chefe)
	if _explosao and !ivulneravel
	{
		vida_atual -= _explosao.dano
		tempo_ivulneravel = room_speed * 3
		ivulneravel = true
	}
	if tempo_ivulneravel > 0 tempo_ivulneravel--;
	if(tempo_ivulneravel <= 0) ivulneravel = false;
}



















