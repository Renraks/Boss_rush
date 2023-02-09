/// @description Insert description here
// You can write your code in this editor

//Variaveis gerais
escolhas_feitas = false
opacidade_enter = 0

//Audio de fim de jogo
audio_play_sound(snd_Sheeesh, 1, false)

//Textos estaticos
texto_experiencia_atual = "Sua experiencia atual é: " + string(global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor])
show_debug_message(global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor])
// ---------- VARIAVEIS DE UPGRADE ---------- //
//Escolha de upgrade
posicao_cursor = 1
textos_upgrade_basico = [
"UPGRADES COMUNS", 
"Melhorar ataque corpo-a-corpo/exp: " + string(global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.experiencia_necessaria]), 
"Melhorar ataque a distancia/exp: " + string(global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.experiencia_necessaria]), 
"Melhorar Habilidade",
"Pular"
]
textos_upgrade_habilidade = [
"UPGRADES DE HABILIDADE",
"EM DESENVOLVIMENTO", 
"EM DESENVOLVIMENTO", 
"Voltar"
]

//Tela atual
telas = ["UPGRADE_BASICO", "UPGRADE_HABILIDADE"]
tela = "UPGRADE_BASICO"

//Verifica quais upgrades podem ser escolhidos
pode_upar_corpo_a_corpo = false
pode_upar_a_distancia = false
if global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor]
>= global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.experiencia_necessaria]
{
	pode_upar_corpo_a_corpo = true
}
if global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor]
>= global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.experiencia_necessaria]
{
	pode_upar_a_distancia = true
}

function reiniciar()
{
	var reinicia
	reinicia = keyboard_check_pressed(vk_enter) + keyboard_check_pressed(vk_enter)
	
	if reinicia
	{
		game_restart()
	}
}

function controle()
{
	//Controle de cima e baixo
	var _up, _down
	_up = keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up)
	_down = keyboard_check_pressed(ord("S")) + keyboard_check_pressed(vk_down)
	
	//Escolhe o texto atual
	var _texto_tela_atual
	switch(tela)
		{
			case "UPGRADE_BASICO":
				_texto_tela_atual = textos_upgrade_basico
			break;
			
			case "UPGRADE_HABILIDADE":
				_texto_tela_atual = textos_upgrade_habilidade
			break;
		}
	if _down
	{
		posicao_cursor++
		
		if posicao_cursor > array_length(_texto_tela_atual) - 1
				{
					posicao_cursor = 1
				}
	}
	
	if _up
	{
		posicao_cursor--
		if posicao_cursor == 0
		{
			posicao_cursor = array_length(_texto_tela_atual) - 1
		}
	}
}


function seleciona()
{
	var _seleciona
	_seleciona = keyboard_check_pressed(vk_enter) + keyboard_check_pressed(vk_space)
	if _seleciona
	{
		switch(posicao_cursor) //Posição do cursor no menu
		{
			//Começa do 1 pois o 0 é o título dos textos
			case 1: //ATAQUE CORPO A CORPO / COOLDOWN HABILIDADE
				switch(tela)
				{
					case telas[0]: //UPGRADE BASICO 
						//Aumenta o dano do ataque corpo a corpo, baseado na dificuldade atual
						if pode_upar_corpo_a_corpo
						{
							scr_aumenta_nivel_ataque(0)
							escolhas_feitas = true
						}
					break;
					
					case telas[1]: //UPGRADE HABILIDADE
						//TO-DO
					break;
				}
			break
		
			case 2: //ATAQUE A DISTANCIA / HABILIDADE MAIS LONGA
				switch(tela)
				{
					case telas[0]: //UPGRADE BASICO
						//Aumenta o dano do ataque corpo a corpo, baseado na dificuldade atual
						if pode_upar_a_distancia
						{
							scr_aumenta_nivel_ataque(1)
							escolhas_feitas = true
						}
					break;
					
					case telas[1]: //UPGRADE HABILIDADE
						//TO-DO
					break;
				}
			break;
			
			case 3: // HABILIDADE / VOLTAR
				switch(tela)
				{
					case telas[0]: //UPGRADE BASICO
						//Vai para a tela de habilidades
						tela = telas[1]
					break;
					
					case telas[1]: //UPGRADE HABILIDADE
						tela = telas[0]
					break;
				}
			break
		
			case 4:
				switch(tela)
				{
					case telas[0]: //UPGRADE BASICO
						//Pula o aumento de nivel
						game_restart()
					break;
					
					case telas[1]:
					break;
				}
			break;
			
			case 5:
				
			break
		
			case 6:
				
			break;
		}
	}
	
	if escolhas_feitas 
	{
		scr_salva_infos_player() 
		game_restart()
	}
}






