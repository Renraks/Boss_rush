/// @description Renderização

//Se desenha
draw_self();

//Verifica a state machine pra definir se coloca efeitos
switch(estado_atual)
{
	case "NORMAL":
		opacidade_enfraquecido = 1
	break;
	
	case "ENFRAQUECIDO":
		opacidade_enfraquecido = lerp(opacidade_enfraquecido, 0, 0.015)
		draw_sprite_ext(spr_efeito_enfraquecido, 0, x, y, 3, 2, 0, c_white, opacidade_enfraquecido)
	break;
}
//Cria os objetos de buildup
if buildup
{
	var bxx = x + irandom_range(-32, 32)
	var byy = y + irandom_range(-32, 32)
	instance_create_layer(bxx, byy, "Boss", obj_boss_buildup)
	if !instance_exists(obj_boss_aviso_ataque)
	{
		
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

//Barras de vida
draw_text(15, 15, vida)
var life_xx1 = (room_width / 20) * 2
var life_xx2 = (room_width / 20) * 18
var life_yy1 = (room_height / 20) * 18
var life_yy2 = (room_height / 20) * 19
var life_xx2_atual = life_xx1 + (((room_width / 20) * 16) * ((vida/vida_max)) )
draw_rectangle_color(life_xx1, life_yy1, life_xx2, life_yy2, c_red, c_red, c_red, c_red, false)
draw_rectangle_color(life_xx1, life_yy1, life_xx2_atual, life_yy2, c_green, c_green, c_green, c_green, false)


//DEBUGGING
//draw_circle_color(x, y, 800, c_white, c_blue, true) // Range maximo do avanço
//draw_circle_color(x, y, 300, c_white, c_red, true) //Range do ataque basico