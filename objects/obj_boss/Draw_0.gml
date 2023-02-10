/// @description Renderização

//Se desenha
draw_self();

//Verifica a state machine pra definir se coloca efeitos
switch(estado_atual)
{
	case "NORMAL":
		opacidade_enfraquecido = 1
		image_speed = 0
		image_index = 0
	break;
	
	case "ENFRAQUECIDO":
		opacidade_enfraquecido = lerp(opacidade_enfraquecido, 0, 0.015)
		draw_sprite_ext(spr_efeito_enfraquecido, 0, x, y, 3, 2, 0, c_white, opacidade_enfraquecido)
		image_speed = 1
	break;
}
//Cria os objetos de buildup
if buildup
{
	var bxx = x + irandom_range(-32, 32)
	var byy = y + irandom_range(-32, 32)
	instance_create_layer(bxx, byy, "Boss", obj_boss_buildup)
	//Na explosao, cria muito mais fumaça
	if comeca_explosao
	{
		repeat 5 
		{	
			bxx = x + irandom_range(-32, 32)
			byy = y + irandom_range(-32, 32)
			instance_create_layer(bxx, byy, "Boss", obj_boss_buildup)
		}
	}
}
if cria_aviso_ataque
{
	cria_aviso_ataque = false
	var aviso = instance_create_layer(x, y, "Efeitos", obj_boss_aviso_ataque)
	aviso.image_angle = point_direction(x, y, obj_player.x, obj_player.y)
	aviso.image_yscale = 48
	aviso.image_xscale = 150
}
if cria_aviso_dash
{
	cria_aviso_dash = false
	var aviso = instance_create_layer(x, y, "Efeitos", obj_boss_aviso_ataque)
	aviso.image_angle = point_direction(x, y, obj_player.x, obj_player.y)
	aviso.image_yscale = 48
	aviso.image_xscale = 400
}
if cria_aviso_explosao
{
	cria_aviso_explosao = false
	var _aviso = instance_create_layer(x, y, "Efeitos", obj_boss_aviso_explosao)
	_aviso.vida		= temporizador_explosao
	_aviso.vida_max = temporizador_explosao
}

//Barras de vida_atual
var life_xx1, life_xx2, life_yy1, life_yy2, life_xx2_atual
if global.player_index.y <= room_height/2
{
	life_yy1 = (room_height / 20) * 18
	life_yy2 = (room_height/ 20) * 19
	
}
else
{	
	life_yy1 = (room_height / 20)
	life_yy2 = (room_height / 20) * 2
}
life_xx1 = (room_width / 15) * 3
life_xx2 = (room_width / 15) * 12
life_xx2_atual = life_xx1 + (((room_width / 15) * 9) * ((vida_atual/vida_max)) )
draw_rectangle_color(life_xx1, life_yy1, life_xx2, life_yy2, c_red, c_red, c_red, c_red, false)
draw_rectangle_color(life_xx1, life_yy1, life_xx2_atual, life_yy2, c_green, c_green, c_green, c_green, false)

//DEBUGGING
//draw_text(15, 15, vida_atual)
//draw_circle_color(x, y, 800, c_white, c_blue, true) // Range maximo do avanço
//draw_circle_color(x, y, 300, c_white, c_red, true) //Range do ataque basico