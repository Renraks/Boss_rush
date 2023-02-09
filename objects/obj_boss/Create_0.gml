/// @description Variaveis

//Variaveis de verificação

//Randomizando sempre que inicia
randomize();

//verifica perseguição
anda = false;
escolhe_direcao = 0 //Muda o tipo de perseguição
chance_de_perseguir = 3 //Quanto maior, menos provavel o boss perseguir o player

//verifica avanço
dando_avanco = false; //Variavel que confirma ter iniciado o avanço
buildup = false //Variavel de buildup do avanço
cria_aviso_dash = false
comeca_dash = false
dano_avanco = 1 + (floor(global.dificuldade/5)) //Aumenta o dano em 1 a cada 5 de dificuldade

//Verifica ataque
ataque = false
tempo_parado = 2 //Tempo em segundos que fica parado
cria_aviso_ataque = false
comeca_ataque = false

//Explosao
cria_aviso_explosao = false
temporizador_explosao = room_speed *  5
explodiu = false //Variavel que verifica se o chefe explodiu ou não
comeca_explosao = false
vida_atual_explosao = 0

posicao_player = 0

// Estados
estado_atual = "NORMAL"; //State-machine
estados = ["NORMAL", "ENFRAQUECIDO"]
dificuldades = ["FACIL", "DIFICIL", "O_FIM"]
dificuldade_atual = dificuldades[0]

//Vida
vida_base = 100
vida_escala = 25
vida_max = vida_base + (global.dificuldade * vida_escala); //Vida maxima do chefe
vida_atual = vida_max;    //Vida atual do chefe
//DEBUG
//vida_atual = 50;    //Vida atual do chefe

//Lerps
opacidade_enfraquecido = 1

//Inicia alarme para perseguir ou começar o avanço
alarm[0] = room_speed *2;

//-------------------- Scripts ---------------------//

// Andar //
function f_andando()
{
	if(anda)
	{
		if(!place_free(x, y)) speed *= -1; // Verifica se pode continuar, se não, inverte a direção
		if(alarm[0] <= 0)
		{
			alarm[0] = room_speed * 4; //Para de andar em 4 segundos
		}
	}
	else
	{
		//Desgruda da parede caso grude sem querer
		if(!place_free(x, y))
		{
			if x > room_width/2 x--
			else x++
			
			if y > room_height/2 y--
			else y++
		}
	}
	image_angle = direction
}

// Avanço //
function f_avancando()
{
	if(dando_avanco)
	{
		para_avanco--; //Começa a diminuir a contagem para parar o avanço
		var _colisao_parede = !place_free(x + speed, y + speed);
		if(_colisao_parede) 
		{
			speed = 0; // Diminui a velocidade conforme se aproxima do objeto
			if(speed == 0) //Para
			{ 
				var _explosao = instance_create_layer(x, y, "Efeitos", obj_explosao_chefe); //Cria a explosão ao bater na parede
				_explosao = 1 + (floor(global.dificuldade/5)) //Aumenta o dano em 1 a cada 5 de dificuldade
			}
			estado_atual = estados[1];
			if !audio_is_playing(snd_Vine_Boom) audio_play_sound(snd_Vine_Boom, 1, false)
		}
		if(para_avanco <= 0)
		{
			dando_avanco = false; //Para o avanço
			speed = 0; //Para de andar e fica estagnado por um tempo
			alarm[0] = room_speed * tempo_parado; //Começa a andar denovo em 2 segundos
		}
	}
}

//Ataque
function f_atacando()
{
	if(ataque) //Se estiver atacando
	{
		ataque = false
		var _posicao_ataque = posicao_player
		var _o_ataque = instance_create_layer(x, y, "Boss", obj_boss_ataque_cc) //Cria o ataque
		_o_ataque.direction = _posicao_ataque //Aponta ele para o player
		speed = 0 //Fica parado
		alarm[0] = room_speed * tempo_parado //Começa o cooldown pra andar
	}
}
// Recebendo dano
function f_recebe_dano(ataque_recebido)
{
	
	
	//Verifica o estado do boss
	switch (estado_atual)
	{
	case estados[0]: //Normal
		vida_atual -= ataque_recebido.dano; 
	break;
	//
	case estados[1]: //Enfraquecido
		ataque_recebido.dano *= 3 //Aumenta o dano no objeto original
		var _dano_recebido_enquanto_enfraquecido = ataque_recebido.dano
		vida_atual -= _dano_recebido_enquanto_enfraquecido
	break;
	}
	//Destroi a instancia do ataque
	ataque_recebido.acertou = true
	instance_destroy(ataque_recebido);
	if(vida_atual <= 0) 
	{
		instance_destroy();
		global.abates += 1; //Adiciona 1 a contagem de abates
		global.abates_consecutivos += 1;
		global.grid_dados_player[# e_dados_player.experiencia, e_atributos_dados_player.valor] += 7 * global.dificuldade
		scr_salva_contagem_abates()
		scr_salva_infos_player()
		room_goto_next()
	}
}

function f_explode()
{
	if explodiu
	{
		explodiu = false
		
		var _explosao = instance_create_layer(x, y, "Boss", obj_explosao_chefe)
		_explosao.image_xscale = 10
		_explosao.image_yscale = 10
		_explosao.dano = 3 + (floor(global.dificuldade/5)) //Aumenta o dano em 1 a cada 5 de dificuldade
		
		alarm[0] = room_speed * (tempo_parado * 2) //Volta a andar
		if !audio_is_playing(snd_Vine_Boom) audio_play_sound(snd_Vine_Boom, 1, false)
	}
}

function f_verifica_stun()
{
	if comeca_explosao
	{
		if vida_atual_explosao == 0
		{
			vida_atual_explosao = vida_atual //Grava a vida_atual
		}
		
		//Se o jogador conseguir causar 10% da vida maxima em dano, atordoa o chefe
		if vida_atual <= vida_atual_explosao - (vida_max/10)
		{
			//Para a explosão
			comeca_explosao = false
			//Atordoa o chefe por 4 segundos (3 + 1 do alarm[1])
			alarm[1] = room_speed * 3
			estado_atual = estados[1]
			//Destroi o aviso de explosao
			var _aviso_explosao = instance_place(x, y, obj_boss_aviso_explosao)
			instance_destroy(_aviso_explosao)
		}
	}
}

function f_checa_estado()
{
	if vida_atual <= (vida_max / 3) * 2 dificuldade_atual = dificuldades[1]
	else if vida_atual <= vida_max/3 dificuldade_atual = dificuldades[2]
	//Verifica o estado atual, e muda as variaveis conforme ele
	switch(dificuldade_atual)
	{
		//Facil
		case dificuldades[0]:
			velocidade_andar = 3
			velocidade_dash = 10
			tempo_parado = 2
			chance_de_perseguir = 4
		break;
		//Dificil
		case dificuldades[1]:
			velocidade_andar = 4
			velocidade_dash = 15
			tempo_parado = 1
			chance_de_perseguir = 2
		break;
		//O fim
		case dificuldades[2]:
			velocidade_andar = 5
			velocidade_dash = 20
			tempo_parado = .5
			chance_de_perseguir = 1
		break;
	}
}