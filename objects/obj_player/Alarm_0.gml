/// @description Cooldown Dash

if(velocidade > 3)
{
	velocidade = 3;
	alarm[0] = room_speed * 2; //Tempo de recarga do dash
}
else
{
	cd_dash = false;	
}

