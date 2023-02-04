/// @description Insert description here
// You can write your code in this editor

//Ao ser destruido, verifica se acertou, se sim, cria um objeto que mostra o dano causado
if acertou
{
	var _texto_dano = instance_create_layer(x, y, "Texto_dano", obj_texto_dano)
	_texto_dano.valor = dano
}