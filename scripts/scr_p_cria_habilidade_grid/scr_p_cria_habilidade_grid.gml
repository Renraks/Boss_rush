// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scr_p_cria_habilidade_grid(habilidade, cooldown, duracao, tamanho){
	global.grid_habilidades_player[# habilidade, e_atributos_habilidades_player.cooldown] = cooldown
	global.grid_habilidades_player[# habilidade, e_atributos_habilidades_player.duracao] = duracao
	global.grid_habilidades_player[# habilidade, e_atributos_habilidades_player.tamanho] = tamanho
}