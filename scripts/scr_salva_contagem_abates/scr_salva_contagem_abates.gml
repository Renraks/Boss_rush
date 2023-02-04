// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_salva_contagem_abates(){
	//Abre o arquivo de save
	ini_open("savedata.ini")
	
	//Abates totais
	var _abates = global.abates
	ini_write_real("Abates", "abates", _abates) //Escreve o save de inventario
	
	//Abates consecutivos E dificuldade
	var _abates_consecutivos = global.abates_consecutivos
	ini_write_real("Abates", "abates_consecutivos", _abates_consecutivos)
	
	ini_close()
	//Fecha o arquivo de save
}