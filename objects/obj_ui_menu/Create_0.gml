/// @description Insert description here
// You can write your code in this editor
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
"Para escolher as opções do menu use o Enter"
]
textos_fdb = 
[
"Este jogo ainda está em desenvolvimento",
"Se tiver algum feedback, pode me mandar no discord/zap",
"Se não tiver nenhum desses, me envie um e-mail",
"renraksGAMING@hotmail.com"
]
textos_tbd = 
[
"LISTA DE COISAS QUE PRETENDO FAZER",
"Mudar posição das paredes da fase",
"Ajustar dificuldade, de acordo com feedback",
"Adicionar sons simples"
]

textos_att = 
[
"ATUALIZAÇÕES",
"Novo ataque e movimentação para o Boss",
"Mais dificil conforme menos vida o Boss tem",
"Adicionado aviso nos ataque do Boss",
"Criada UI de vida do player e do Boss",
"Criado UI do cooldown do Dash e Tiro"
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
	var seleciona
	seleciona = keyboard_check_pressed(vk_enter)
	if seleciona
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

function escreve_array(array, rw, rh, xn = 1, yn = 1)
{
	var xx, yy
	xx = room_width/rw * xn
	yy = room_height/rh * yn
	draw_set_font(f_titulo)
	draw_set_alpha(1)
	for (var i = 0; i < array_length(array); i ++)
	{
		if i = 0 draw_set_font(f_titulo)
		else draw_set_font(f_texto)
		draw_text(xx, yy + (30 * i - 1), array[i])
	}
	
	draw_set_font(-1)
	draw_set_alpha(1)
}


