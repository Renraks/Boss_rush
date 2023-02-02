/// @description Insert description here
// You can write your code in this editor

draw_set_font(f_texto)
draw_set_color(c_white)

var xx_exp, yy_exp
xx_exp = 100
yy_exp = room_height - 100

draw_set_alpha(1)

draw_text(xx_exp, yy_exp, texto_experiencia_atual)

var xx_upgrade, yy_upgrade
xx_upgrade = room_width/3
yy_upgrade = room_height/3

//Desenha o cursor
switch(tela)
{
	case telas[0]:
		draw_sprite_ext(spr_cursor_ui_menu, 0, xx_upgrade - 48, yy_upgrade + (50 * posicao_cursor), 1, 1, 0, c_white, 1)
	break;
	
	case telas[1]:
		draw_sprite_ext(spr_cursor_ui_menu, 0, xx_upgrade - 48, yy_upgrade + (50 * posicao_cursor) , 1, 1, 0, c_white, 1)
	break;
}

if !escolhas_feitas
{
	switch(tela)
	{
		case telas[0]: //UPGRADE BASICO
			scr_escreve_array(textos_upgrade_basico, 3, 3,,,50,, f_titulo)
		break;
		
		case telas[1]: //UPGRADE HABILIDADE
			scr_escreve_array(textos_upgrade_habilidade, 3, 3,,,50,, f_titulo)
		break;
	}
}
else
{
	opacidade_enter = lerp(opacidade_enter, 1, 0.01)
	draw_set_alpha(opacidade_enter)
	//draw_text(xx, yy2, "Enter para reiniciar")
}

draw_set_font(-1)




