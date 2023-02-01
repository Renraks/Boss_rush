/// @description Escolhe uma direção para andar

if(anda)
{
	escolhe_direcao = irandom(3) //Randomiza se persegue ou se anda aleatorio, mais chance de andar aleatorio
	if escolhe_direcao = 0 direction = point_direction(x, y, obj_player.x, obj_player.y)
	else direction = random(359);//Escolhe a direção
	alarm[1] = room_speed / 2;//Muda de direção
}
else
{
	var p_distancia = distance_to_object(obj_player)
	if p_distancia < 800 and p_distancia > 300
	{
		buildup = false; //Desliga o buildup
		dando_avanco = true; //Inicia o avanço
		direction = posicao_player; //Trava a direção com a do player naquele momento
		speed = velocidade_dash
		para_avanco = room_speed; //Começa a parar o avanço
	}
	else if p_distancia < 300
	{
		//Ataque corpo a corpo
		buildup = false
		ataque = true
		audio_play_sound(snd_Slap, 1, false)
	}
	else
	{
		buildup = false; //Para a fumaça de buildup
		alarm[0] = room_speed //Volta a andar em 1 segundo
	}
}
