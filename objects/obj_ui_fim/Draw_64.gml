/// @description Insert description here
// You can write your code in this editor

draw_set_font(f_agradecimento)
draw_set_color(c_white)

var xx, yy, yy2
xx = room_width/3
yy = room_height/4
yy2 = room_height/4 * 3

draw_set_alpha(1)
draw_text(xx, yy, "Obrigado por joojar!!")

if temporizador <= 0
{
	opacidade_enter = lerp(opacidade_enter, 1, 0.01)
	draw_set_alpha(opacidade_enter)
	draw_text(xx, yy2, "Enter para reiniciar")
}

draw_set_font(-1)




