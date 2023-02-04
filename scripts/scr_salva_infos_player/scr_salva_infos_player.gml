// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_salva_infos_player(){
	//Abre o arquivo de save
	ini_open("savedata.ini")
	
	//Experiencia total
	//ini_write_real("Player", "experiencia", global.experiencia)
	//Guarda os dados da Grid de ataques (Dano, nivel, exp_necessaria, escala, quantidade)
	ini_write_string("Player", "grid_ataques_player", ds_grid_write(global.grid_ataques_player))
	ini_write_string("Player", "grid_dados_player", ds_grid_write(global.grid_dados_player))
	ini_close()
}