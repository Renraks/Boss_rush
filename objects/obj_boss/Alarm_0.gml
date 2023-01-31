/// @description Segue o player ou para de segui-lo

if(anda) 
{
	anda = false; //Para de andar
	speed = 0;
	alarm[1] = room_speed / 2; //Temporizador até o avanço/ataque
	var p_distancia = distance_to_object(obj_player)
	if p_distancia < 800 and p_distancia > 300 cria_aviso_dash = true
	else if p_distancia < 300 cria_aviso_ataque = true
	posicao_player = point_direction(x, y, obj_player.x, obj_player.y)
	buildup = true //Ativa o build-up
}
else 
{
	anda = true; //Começa a andar
	estado_atual = "NORMAL";
	alarm[1] = 1; //Escolhe uma direção em 1 frame
	speed = velocidade_andar
}


