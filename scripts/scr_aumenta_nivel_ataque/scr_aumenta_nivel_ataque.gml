// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_aumenta_nivel_ataque(ataque){
	if ataque == 0
	{
		//Ataque corpo a corpo
		global.dano_ataque_corpo_a_corpo *= global.escala_dano_ataque_corpo_a_corpo
		global.nivel_corpo_a_corpo += 1
		global.experiencia_necessaria_upgrade_corpo_a_corpo *= 2
	}
	else if ataque == 1
	{
		//Ataque a distancia//Ataque corpo a corpo
		global.dano_ataque_a_distancia *= global.escala_dano_ataque_a_distancia
		global.nivel_a_distancia += 1
		global.experiencia_necessaria_upgrade_a_distancia *= 3
	}
}