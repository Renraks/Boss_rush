/// @description UI

//MENU
var xx, yy
xx = room_width/2 - 100
yy = room_height/2

draw_set_font(f_menu)
draw_set_alpha(1)

draw_set_color(c_red)
draw_text(xx, yy - yoffset_menu[0] - 100, texto_titulo)
draw_set_color(c_black)
draw_text(xx, yy - yoffset_menu[0], textos_menu[0])
draw_text(xx, yy - yoffset_menu[1], textos_menu[1])

draw_sprite_ext(spr_cursor_ui_menu, 0, xx - 32, yy - (yoffset_menu[posicao_cursor] - 5), 1, 1, 0, c_white, 1)


//TUTORIAL
escreve_array(textos_tutorial, 5, 6, 3)
//FEEDBACK
escreve_array(textos_fdb, 15, 8, , 5)
//LISTA TBD
escreve_array(textos_tbd, 15, 8, 8, 5)
//ATUALIZAÇÕES
escreve_array(textos_att, 15, 8, , 2)
