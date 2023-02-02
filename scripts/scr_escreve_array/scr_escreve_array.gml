/// @function scr_escreve_array(array, div_room_width, div_room_height, multipl_room_width, multipl_room_height)
/// @param {array} array O array a ser usado
/// @param {real} div_room_width O divisor da largura da tela
/// @param {real} div_room_height O dividor da altura da tela
/// @param {real} multipl_room_width O multiplicador da largura da tela
/// @param {real} multipl_room_height O multiplicador da altura da tela

function scr_escreve_array(array, rw, rh, xn = 1, yn = 1, separacao = 30, fonte_1 = f_titulo, fonte_2 = f_texto){
	var xx, yy
	xx = room_width/rw * xn
	yy = room_height/rh * yn
	draw_set_font(fonte_1)
	draw_set_alpha(1)
	for (var i = 0; i < array_length(array); i ++)
	{
		if i = 0 draw_set_font(fonte_1)
		else draw_set_font(fonte_2)
		draw_text(xx, yy + (separacao * i - 1), array[i])
	}
	draw_set_font(-1)
	draw_set_alpha(1)

}