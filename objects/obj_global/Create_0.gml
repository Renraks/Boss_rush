/// @description Variaveis globais

//Instanciando as variaveis globais usadas em outras
global.dano_ataque_corpo_a_corpo = 2 //Dano do ataque corpo a corpo do player
global.dano_ataque_a_distancia = 4 //Dano do ataque a distancia do player

global.experiencia_necessaria_upgrade_corpo_a_corpo = 5
global.experiencia_necessaria_upgrade_a_distancia = 7
global.experiencia_necessaria_upgrade_cooldown = 10
global.experiencia_necessaria_upgrade_tamanho = 20

//Recuperando dados salvos
ini_open("savedata.ini")
//Dados do jogo
//ABATES
global.abates = ini_read_real("Abates", "abates", 0)
global.abates_consecutivos =  ini_read_real("Abates", "abates_consecutivos", 0)
global.dificuldade = ini_read_real("Abates", "abates_consecutivos", 0) + 1 //Recupera a dificuldade da ultima vez que o player jogou
//Dados do Player
//NIVEIS
global.nivel_corpo_a_corpo = ini_read_real("Player", "nivel_corpo_a_corpo", 1) //Nivel do ataque corpo a corpo
global.nivel_a_distancia = ini_read_real("Player", "nivel_a_distancia", 1) //Nivel do ataque a distancia
global.experiencia = ini_read_real("Player", "experiencia", 0)
//UPGRADES
global.experiencia_necessaria_upgrade_corpo_a_corpo  = ini_read_real("Player", "experiencia_necessaria_upgrade_corpo_a_corpo", 5)
global.experiencia_necessaria_upgrade_a_distancia = ini_read_real("Player", "experiencia_necessaria_upgrade_a_distancia", 7)
global.experiencia_necessaria_upgrade_cooldown = ini_read_real("Player", "experiencia_necessaria_upgrade_cooldown", 10)
global.experiencia_necessaria_upgrade_tamanho = ini_read_real("Player", "experiencia_necessaria_upgrade_tamanho", 20)
//DANO
global.dano_ataque_corpo_a_corpo = ini_read_real("Player", "dano_corpo_a_corpo", 2)
global.dano_ataque_a_distancia = ini_read_real("Player", "dano_a_distancia", 4)
ini_close()

//Instanciando variaveis globais, dependentes de outras
global.escala_dano_ataque_corpo_a_corpo = (1.05 * global.nivel_corpo_a_corpo) //Escala de dano do ataque a corpo-a-corpo do player
global.escala_dano_ataque_a_distancia = (1.1 * global.nivel_a_distancia) //Escala do ataque a distancia do player

show_debug_message(global.escala_dano_ataque_a_distancia)





