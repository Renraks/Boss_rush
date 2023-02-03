// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_p_cria_ataque_grid(ataque, dano, nivel_atual, experiencia_necessaria, escala_de_dano, quantidade_criada, cooldown){
	global.grid_ataques_player[# ataque, e_atributos_ataques_player.dano] = dano
	global.grid_ataques_player[# ataque, e_atributos_ataques_player.nivel_atual] = nivel_atual 
	global.grid_ataques_player[# ataque, e_atributos_ataques_player.experiencia_necessaria] = experiencia_necessaria 
	global.grid_ataques_player[# ataque, e_atributos_ataques_player.escala_de_dano] = escala_de_dano 
	global.grid_ataques_player[# ataque, e_atributos_ataques_player.quantidade_criada] = quantidade_criada 
	global.grid_ataques_player[# ataque, e_atributos_ataques_player.cooldown] = cooldown
}