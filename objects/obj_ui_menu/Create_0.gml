/// @description Primeiro objeto do jogo

//Variaveis de texto
texto_total_abates = "Abates totais: " + string(global.abates)
texto_total_abates_consecutivos = "Abates consecutivos: " + string(global.abates_consecutivos)
texto_dificuldade_atual = "Dificuldade: " + string(global.dificuldade)
texto_titulo = "Boss Rush"
textos_menu = ["Começar", "Sair"]
yoffset_menu = [100, 50]
posicao_cursor = 0
textos_tutorial = 
[
"TUTORIAL",
"Movimente-se com WASD",
"Ataque de perto com o botão esquerdo do mouse",
"Atire com o botão direito do mouse",
"Se esquive com a barra de espaço",
"Para escolher as opções do menu use o Enter ou Espaço"
]
textos_fdb = 
[
"Este jogo ainda está em desenvolvimento",
"Se tiver algum feedback, pode me mandar no discord/zap/telegram",
"Se não tiver nenhum desses, me envie um e-mail",
"renraksGAMING@hotmail.com"
]
textos_tbd = 
[
"LISTA DE COISAS QUE PRETENDO FAZER",
"Criar fases semi-randomicas",
"Iniciar desenvolvimento do novo Chefe"
]

textos_att = 
[
"ATUALIZAÇÕES",
"Adicionado ESPAÇO como opção além do ENTER",
"Adicionado sistema de dificuldade",
]

function controle()
{
	var up, down
	up = keyboard_check_pressed(ord("W")) + keyboard_check_pressed(vk_up)
	down = keyboard_check_pressed(ord("S")) + keyboard_check_pressed(vk_down)
	
	if down
	{
		posicao_cursor++
		if posicao_cursor > array_length(textos_menu) - 1
		{
			posicao_cursor = 0
		}
	}
	
	if up
	{
		posicao_cursor--
		if posicao_cursor < 0
		{
			posicao_cursor = array_length(textos_menu) - 1
		}	
	}
}

function seleciona()
{
	var _seleciona
	_seleciona = keyboard_check_pressed(vk_enter) + keyboard_check_pressed(vk_space)
	if _seleciona
	{
		switch(posicao_cursor)
		{
			case 0:
				room_goto_next()
			break
		
			case 1:
				game_end();
			break;
		}
	}
	
}

//Let's GOOOOOOOOOOOOOO
audio_play_sound(snd_Let_s_gooooooooo, 1, false)