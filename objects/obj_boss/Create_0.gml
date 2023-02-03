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

//Verifica ataque
ataque = false
tempo_parado = 2 //Tempo em segundos que fica parado
cria_aviso_ataque = false
comeca_ataque = false

//Explosao
cria_aviso_explosao = false
explodiu = false //Variavel que verifica se o chefe explodiu ou não
comeca_explosao = false

posicao_player = 0

// Estados
estado_atual = "NORMAL"; //State-machine
dificuldades = ["FACIL", "DIFICIL", "O_FIM"]
dificuldade_atual = dificuldades[0]

//Vida
vida_base = 150
vida_escala = 50
vida_max = vida_base + (global.dificuldade * vida_escala); //Vida maxima do chefe
vida = 1;    //Vida atual do chefe

//Lerps
opacidade_enfraquecido = 1

//Inicia alarme para perseguir ou começar o avanço
alarm[0] = room_speed *2;

//-------------------- Scripts ---------------------//

// Andar //
function andando()
{
	if(anda)
	{
		//if(place_free(x, y)) mp_potential_step(obj_player.x, obj_player.y, 2, 0);//Código antigo de seguir o player
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
}

// Avanço //
function avancando()
{
	if(dando_avanco)
	{
		para_avanco--; //Começa a diminuir a contagem para parar o avanço
		var _colisao_parede = !place_free(x + speed, y + speed);
		if(_colisao_parede) 
		{
			speed = 0; // Diminui a velocidade conforme se aproxima do objeto
			if(speed == 0) instance_create_layer(x, y, "Efeitos", obj_explosao_chefe);//Cria a explosão ao bater na parede
			estado_atual = "ENFRAQUECIDO";
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
function atacando()
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
function recebe_dano(ataque_recebido)
{
	
	var _dano_final = ataque_recebido.dano //Cria a variavel de dano
	
	//Verifica o estado do boss
	switch (estado_atual)
	{
	case "NORMAL": 
		vida -= _dano_final; 
	break;
	//
	case "ENFRAQUECIDO": 
		vida -= _dano_final * 3; 
	break;
	}
	//Destroi a instancia do ataque
	instance_destroy(ataque_recebido);
	if(vida <= 0) 
	{
		instance_destroy();
		global.abates += 1; //Adiciona 1 a contagem de abates
		global.abates_consecutivos += 1;
		global.experiencia += 7 * global.dificuldade
		scr_salva_contagem_abates()
		scr_salva_infos_player()
		room_goto_next()
	}
}

function explode()
{
	if explodiu
	{
		explodiu = false
		
		var _explosao = instance_create_layer(x, y, "Boss", obj_explosao_chefe)
		_explosao.image_xscale = 10
		_explosao.image_yscale = 10
		_explosao.dano = 4
		
		alarm[0] = room_speed * (tempo_parado * 2) //Volta a andar
		if !audio_is_playing(snd_Vine_Boom) audio_play_sound(snd_Vine_Boom, 1, false)
	}
}

function checa_estado()
{
	if vida <= (vida_max / 3) * 2 dificuldade_atual = dificuldades[1]
	else if vida <= vida_max/3 dificuldade_atual = dificuldades[2]
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