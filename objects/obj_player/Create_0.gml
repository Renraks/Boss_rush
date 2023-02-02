/// @description Variaveis de criação

// ------------- Variaveis básicas -------------- //
velocidade = 3; // Velocidade do player
vida = 5; // Vida do player
cd_dash = false; // Tempo de recarga do dash
cd_ataque = false // Tempo de recarga do ataque
cd_tiro = false; // Tempo de recarga do tiro
ivulneravel = false; // Ativa a ivulnerabilidade
tempo_ivulneravel = 0; // Checa se perdeu vida
cooldown_tiro = room_speed * 6

//Variavel global para usar na UI
global.player_index = object_index

//Métodos

// ------- Movimento ----------//
function movimento(){
	//Variaveis de movimentação
	var up, down, right, left;
	up = keyboard_check(ord("W"));
	down = keyboard_check(ord("S"));
	right = keyboard_check(ord("D"));
	left = keyboard_check(ord("A"));
	
	//Verificando se está livre e andando
	speed = 0;
	if(place_free(x, y +(down - up)* velocidade)) y += (down - up) * velocidade;
	if(place_free(x + (right - left) * velocidade, y))x += (right - left) * velocidade;
}

// -------- Atirando ----------//
function ataca()
{	
	var ataca = mouse_button = mb_left
	if (ataca && !cd_ataque)
	{
		var _ataque = instance_create_layer(x, y, "Ataque", obj_ataque_1)
		_ataque.dano = global.dano_ataque_corpo_a_corpo
		alarm[1] = room_speed/2
		cd_ataque = true;
		audio_play_sound(snd_Punch, 1, false)
	}
}
// -------- Atirando ----------//
function atira()
{
	var ativar_tiro = mouse_button = mb_right;
	if(ativar_tiro && !cd_tiro) 
	{
		var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro1_player);
		_tiro.dano = global.dano_ataque_a_distancia
		alarm[2] = cooldown_tiro;
		cd_tiro = true;
		audio_play_sound(snd_Gun_shoot, 1, false)
	}
}

// -------- Dash ----------- //
function corrida()
{
	var ativar_dash = keyboard_check_pressed(vk_space);
	if(ativar_dash and !cd_dash)
	{
		velocidade *= 6;
		alarm[0] = room_speed/6;
		cd_dash = true;
		audio_play_sound(snd_Slide, 1, false)
	}	
}

// --------- Recebendo dano ------------ //
function danificado()
{
	//Se colidir com o chefe, toma 1 de dano
	var chefe = instance_place(x, y, obj_boss)
	if(chefe and !ivulneravel)
	{
		if !chefe.dando_avanco vida--;
		else vida -= 2
		tempo_ivulneravel = room_speed * 3;
		ivulneravel = true;
	}
	//Se receber um ataque do chefe, toma mais dano ainda
	if place_meeting(x, y, obj_boss_ataque_cc) and !ivulneravel
	{
		vida-= 2
		tempo_ivulneravel = room_speed * 3
		ivulneravel = true
	}
	var _explosao = instance_place(x, y, obj_explosao_chefe)
	if _explosao and !ivulneravel
	{
		vida -= _explosao.dano
		tempo_ivulneravel = room_speed * 3
		ivulneravel = true
	}
	if tempo_ivulneravel > 0 tempo_ivulneravel--;
	if(tempo_ivulneravel <= 0) ivulneravel = false;
}



















