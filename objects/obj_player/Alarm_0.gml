/// @description Cooldown Dash

if(velocidade_atual > velocidade_base)
{
	velocidade_atual = velocidade_base;
	alarm[0] = cooldown_dash; //Tempo de recarga do dash
}
else
{
	dash_em_cooldown = false;	
}

