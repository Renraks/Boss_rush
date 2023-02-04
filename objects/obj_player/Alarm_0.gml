/// @description Cooldown Dash

if(velocidade_atual > velocidade_base)
{
	velocidade_atual = velocidade_base;
	show_debug_message(cooldown_dash)
	alarm[0] = cooldown_dash; //Tempo de recarga do dash
}
else
{
	dash_em_cooldown = false;	
}

