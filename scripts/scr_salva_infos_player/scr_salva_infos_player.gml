// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_salva_infos_player(){
	//Abre o arquivo de save
	ini_open("savedata.ini")
	
	//Niveis de ataque
	ini_write_real("Player", "nivel_corpo_a_corpo", global.nivel_corpo_a_corpo)
	ini_write_real("Player", "nivel_a_distancia", global.nivel_a_distancia)
	
	//Dano
	ini_write_real("Player", "dano_corpo_a_corpo", global.dano_ataque_corpo_a_corpo)
	ini_write_real("Player", "dano_a_distancia", global.dano_ataque_a_distancia)
	
	//Experiencia
	ini_write_real("Player", "experiencia", global.experiencia)
	
	//Experiencia necessária
	ini_write_real("Player", "experiencia_necessaria_upgrade_corpo_a_corpo", global.experiencia_necessaria_upgrade_corpo_a_corpo)
    ini_write_real("Player", "experiencia_necessaria_upgrade_a_distancia", global.experiencia_necessaria_upgrade_a_distancia)
    ini_write_real("Player", "experiencia_necessaria_upgrade_cooldown", global.experiencia_necessaria_upgrade_cooldown)
    ini_write_real("Player", "experiencia_necessaria_upgrade_tamanho", global.experiencia_necessaria_upgrade_tamanho)
	
	ini_close()
}