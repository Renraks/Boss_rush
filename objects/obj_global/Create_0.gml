/// @description Variaveis globais

/// ----------- DADOS DO PLAYER ------------- ///
// -------- BASICOS ------- //
enum e_dados_player
{
	none,
	velocidade,
	vida_max,
	total
}

enum e_atributos_dados_player
{
	none,
	valor, 
	nivel,
	experiencia_necessaria,
	total 
}
// -------- ATAQUES ------- //
enum e_ataques_player
{
	none,
	corpo_a_corpo, //Mouse esquerdo
	a_distancia, //Mouse direito
	total
}

enum e_atributos_ataques_player
{
	none,
	dano, //Dano causado pelo ataque
	nivel_atual, //Nivel atual do ataque
	experiencia_necessaria, //Experiencia necessaria para subir o ataque de nivel
	escala_de_dano, //Quanto o ataque vai aumentar o dano quando subir de nivel
	quantidade_criada, //Quantidade de projeteis/hitboxes o ataque cria
	cooldown,
	total
}

// ------ HABILIDADES ------- //
enum e_habilidades_player
{
	none,
	dash, //Dash do player
	//Adicionar outra habilidade
	total
}

enum e_atributos_habilidades_player
{
	none,
	cooldown, //Tempo de recarga da habilidade
	duracao, //Duração da habilidade
	tamanho, //Tamanho da habilidade
	total 
}
//Instanciando as variaveis globais usadas em outras
global.grid_dados_player = ds_grid_create(e_dados_player.total, 1) //Dados basicos do player
global.grid_ataques_player = ds_grid_create(e_ataques_player.total, e_atributos_ataques_player.total) //Cria a grid de ataques
global.grid_habilidades_player = ds_grid_create(e_habilidades_player.total, e_atributos_habilidades_player.total) //Cria grid de habilidades

//Cria os valores basicos do player
scr_p_cria_dados_grid(e_dados_player.velocidade, 3, 1, 100)
scr_p_cria_dados_grid(e_dados_player.velocidade, 5, 1, 500)

//Cria os dados basicos de ataques comuns
scr_p_cria_ataque_grid( e_ataques_player.corpo_a_corpo, 2, 1, 5, 1.05, 1, room_speed/2)
scr_p_cria_ataque_grid( e_ataques_player.a_distancia, 4, 1, 7, 1.1, 1, room_speed * 6)

//Cria os dados basicos de habilidades
scr_p_cria_habilidade_grid(e_habilidades_player.dash, 4, room_speed/6, 0)


//Recuperando dados salvos
ini_open("savedata.ini")
//Dados do jogo
//ABATES
global.abates = ini_read_real("Abates", "abates", 0)
global.abates_consecutivos =  ini_read_real("Abates", "abates_consecutivos", 0)
global.dificuldade = ini_read_real("Abates", "abates_consecutivos", 0) + 1 //Recupera a dificuldade da ultima vez que o player jogou
//Dados do Player
var _grid_ataques_player = ini_read_string("Player", "grid_ataques_player", "null")
//NIVEIS
global.experiencia = ini_read_real("Player", "experiencia", 0)
ini_close()

ds_grid_read(global.grid_ataques_player, _grid_ataques_player) //Recupera os dados de ataque do player do save file

