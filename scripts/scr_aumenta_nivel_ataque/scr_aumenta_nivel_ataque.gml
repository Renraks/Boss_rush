// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_aumenta_nivel_ataque(ataque){
	if ataque == 0
	{
		//Ataque corpo a corpo
		//Paga a exp
		global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor]
		-= global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.experiencia_necessaria]
		//Dano
		global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.dano] 
		*= global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.escala_de_dano]
		//Nivel
		global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.nivel_atual] += 1
		//Exp necessaria
		global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.experiencia_necessaria] *= 2
	}
	else if ataque == 1
	{
		//Ataque a distancia
		//Paga a exp
		global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor]
		-= global.grid_ataques_player[# e_ataques_player.corpo_a_corpo, e_atributos_ataques_player.experiencia_necessaria]
		//Dano
		global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.dano] 
		*= global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.escala_de_dano]
		//Nivel
		global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.nivel_atual] += 1
		//Exp necessária
		global.grid_ataques_player[# e_ataques_player.a_distancia, e_atributos_ataques_player.experiencia_necessaria] *= 3
	}
}