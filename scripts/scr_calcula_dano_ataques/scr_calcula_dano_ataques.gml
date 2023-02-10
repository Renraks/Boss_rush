// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_calcula_dano_ataques(ataque, dano_base){
	var _nivel_ataque = global.grid_ataques_player[# ataque, e_atributos_ataques_player.nivel_atual] - 1
	//Repete o calculo a quantidade de niveis atual do jogador
	if _nivel_ataque > 1
	{
		repeat _nivel_ataque
		{
			//Calcula o dano que o ataque deve causar nessa gameplay
			dano_base *= global.grid_ataques_player[# ataque, e_atributos_ataques_player.escala_de_dano]
		}
	}
	//Volta o dano causado pelo ataque
	return dano_base
}