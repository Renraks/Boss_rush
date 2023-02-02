/// @description Insert description here
// You can write your code in this editor

//DEBUGGING
//Instanciando as variaveis globais
global.dano_ataque_corpo_a_corpo = 0 //Dano do ataque corpo a corpo do player
global.dano_ataque_a_distancia = 0 //Dano do ataque a distancia do player

//Recuperando dados salvos
ini_open("savedata.ini")
//Dados do jogo
//ABATES
global.abates = ini_read_real("Abates", "abates", 0)
global.abates_consecutivos =  ini_read_real("Abates", "abates_consecutivos", 0)
global.dificuldade = ini_read_real("Abates", "abates_consecutivos", 0) + 1 //Recupera a dificuldade da ultima vez que o player jogou
//Dados do Player
//NIVEIS
global.nivel_corpo_a_corpo = ini_read_real("Player", "nivel_corpo_a_corpo", 1) //Nivel do ataque corpo a corpo
global.nivel_a_distancia = ini_read_real("Player", "nivel_a_distancia", 1) //Nivel do ataque a distancia
global.escala_dano_ataque_corpo_a_corpo = (0.1 * global.nivel_corpo_a_corpo) //Escala de dano do ataque a corpo-a-corpo do player
global.escala_dano_ataque_a_distancia = (0.3 * global.nivel_a_distancia) //Escala do ataque a distancia do player
global.experiencia = ini_read_real("Player", "experiencia", 0)
ini_close()

//DEBUGGIN

//Variaveis gerais
escolhas_feitas = false
opacidade_enter = 0

//Audio de fim de jogo
audio_play_sound(snd_Sheeesh, 1, false)

//Textos estaticos
texto_experiencia_atual = "Sua experiencia atual é: " + string(global.experiencia)

// ---------- VARIAVEIS DE UPGRADE ---------- //
//Escolha de upgrade
posicao_cursor = 1
textos_upgrade_basico = [
"UPGRADES COMUNS", 
"Melhorar ataque corpo-a-corpo/exp: " + string(global.experiencia_necessaria_upgrade_corpo_a_corpo), 
"Melhorar ataque a distancia/exp: " + string(global.experiencia_necessaria_upgrade_a_distancia), 
"Melhorar Habilidade",
"Pular"]
textos_upgrade_habilidade = ["UPGRADES DE HABILIDADE", "EM DESENVOLVIMENTO", "EM DESENVOLVIMENTO", "Voltar"]

//Tela atual
telas = ["UPGRADE_BASICO", "UPGRADE_HABILIDADE"]
tela = "UPGRADE_BASICO"

//Verifica quais upgrades podem ser escolhidos
pode_upar_corpo_a_corpo = false
pode_upar_a_distancia = false
if global.experiencia >= global.experiencia_necessaria_upgrade_corpo_a_corpo
{
	pode_upar_corpo_a_corpo = true
}
if global.experiencia >= global.experiencia_necessaria_upgrade_a_distancia
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
	var up, down
	up = keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up)
	down = keyboard_check_pressed(ord("S")) + keyboard_check_pressed(vk_down)
	
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
	if down
	{
		posicao_cursor++
		
		if posicao_cursor > array_length(textos_upgrade_basico) - 1
				{
					posicao_cursor = 1
				}
	}
	
	if up
	{
		posicao_cursor--
		if posicao_cursor == 0
		{
			posicao_cursor = array_length(textos_upgrade_basico) - 1
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






