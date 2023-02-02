/// @description Segue o player ou para de segui-lo

if(anda) 
{
	anda = false; //Para de andar
	speed = 0;
	var _probabilidade_explosao
	switch(dificuldade_atual)
	{
		case dificuldades[0]:
			_probabilidade_explosao = 21
		break;
		
		case dificuldades[1]:
		{
			_probabilidade_explosao = 20
			if global.dificuldade >= 10 _probabilidade_explosao = 18
		}
		
		case dificuldades[2]:
			_probabilidade_explosao = 12
			if global.dificuldade >= 10 _probabilidade_explosao = 10
		break;
	}
	
	var _chance_explosao = 0
	var p_distancia = distance_to_object(obj_player)
	if global.dificuldade >= 4
	{
		var _chance_explosao 
		_chance_explosao = irandom(20)
		if _chance_explosao >= _probabilidade_explosao
		{
			cria_aviso_explosao = true
			comeca_explosao = true
			alarm[1] = room_speed * 5 //Temporizador da explosão
		}
	}
	if !comeca_explosao
	{
		if p_distancia < 800 and p_distancia > 300 
		{
			comeca_dash = true
			cria_aviso_dash = true 
			alarm[1] = room_speed / 2; //Temporizador até o avanço/ataque/explosao
		}
		else if p_distancia < 300 
		{
			comeca_ataque = true
			cria_aviso_ataque = true
			alarm[1] = room_speed / 2; //Temporizador até o avanço/ataque/explosao
		}
	}
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


