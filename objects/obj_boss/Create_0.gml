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

//Verifica ataque
ataque = false
tempo_parado = 2 //Tempo em segundos que fica parado
cria_aviso_ataque = false
cria_aviso_dash = false

posicao_player = 0

// Estados
estado_atual = "NORMAL"; //State-machine
dificuldades = ["FACIL", "DIFICIL", "O_FIM"]
dificuldade_atual = dificuldades[0]

//Vida
vida_max = 300; //Vida maxima do chefe
vida = 300; //Vida atual do chefe

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
		var colisao_parede = !place_free(x + speed, y + speed);
		if(colisao_parede) 
		{
			speed = 0; // Diminui a velocidade conforme se aproxima do objeto
			if(speed == 0) instance_create_layer(x, y, "Efeitos", obj_explosao_chefe);//Cria a explosão ao bater na parede
			estado_atual = "ENFRAQUECIDO";
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
		var posicao_ataque = posicao_player
		var o_ataque = instance_create_layer(x, y, "Boss", obj_boss_ataque_cc) //Cria o ataque
		o_ataque.direction = posicao_ataque //Aponta ele para o player
		speed = 0 //Fica parado
		alarm[0] = room_speed * 2 //Começa o cooldown pra andar
	}
}
// Recebendo dano
function recebe_dano(ataque_recebido)
{
	
	var dano_final = ataque_recebido.dano //Cria a variavel de dano
	
	//Verifica o estado do boss
	switch (estado_atual)
	{
	case "NORMAL": 
		vida -= dano_final; 
	break;
	//
	case "ENFRAQUECIDO": 
		vida -= dano_final * 3; 
	break;
	}
	//Destroi a instancia do ataque
	instance_destroy(ataque_recebido);
	if(vida <= 0) 
	{
		instance_destroy();
		room_goto_next()
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