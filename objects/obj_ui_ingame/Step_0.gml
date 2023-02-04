/// @description Cooldown

//Se o dash estiver em cooldown
if jogador.dash_em_cooldown
{
	if alpha_dash >= 1
	{
		alpha_dash = 0.1
		cooldown_dash = jogador.cooldown_dash / room_speed
	}
	alpha_dash = lerp(alpha_dash, 1, 0.01)
	contador_dash--
	if contador_dash <= 0
	{
		contador_dash = room_speed
		cooldown_dash--
	}
}
else
{
	alpha_dash = 1
	if contador_dash < room_speed contador_dash = room_speed
	cooldown_dash = 0
}

if jogador.ataque_ad_em_cooldown
{
	if alpha_tiro >= 1
	{
		alpha_tiro = .1
		cooldown_tiro = jogador.cooldown_ataque_ad / room_speed
	}
	alpha_tiro = lerp(alpha_tiro, 1, 0.005)
	contador_tiro--
	if contador_tiro <= 0
	{
		contador_tiro = room_speed
		cooldown_tiro--
	}
}
else
{
	alpha_tiro = 1
	if contador_tiro < room_speed contador_tiro = room_speed
	cooldown_tiro = 0
	
}