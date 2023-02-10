/// @description Insert description here
// You can write your code in this editor

randomize()
//Variaveis de objeto
var _chao, _parede_externa, _parede_interna, _chefe, _player

_chao = $000000
_parede_externa = $FFFFFF
//_parede_interna = $847E87
_parede_interna = make_color_rgb(132,126,135)
//_chefe = $FF0000
_chefe = make_color_rgb(255, 0, 0)
//_player = $0024FF
_player = make_color_rgb(0,36,255)


//Variaveis da geração de mapa
var _imagem, _largura, _altura, _celula_altura, _celula_largura, _surf, _l, _a, _cor_atual, _objeto, _layer

_imagem = spr_fases_quadrado
_fase = irandom(3)
_largura = sprite_get_width(_imagem)
_altura = sprite_get_height(_imagem)

_celula_largura = floor(room_width / _largura)
_celula_altura = floor(room_height / _altura)

_surf = surface_create(_largura, _altura)

surface_set_target(_surf)
draw_sprite(_imagem, _fase, 0, 0)
surface_reset_target()

for (_l = 0; _l < _largura; _l++)
{
	for (_a = 0; _a < _altura; _a++)
	{
		_cor_atual = surface_getpixel(_surf, _l, _a)
		_objeto = noone
		
		switch _cor_atual
		{
			case _player:
				_objeto = obj_player
				_layer = "Player"
			break
			
			case _chefe:
				_objeto = obj_boss
				_layer = "Boss"
			break;
			
			case _chao:
				_objeto = obj_chao
				_layer = "Chao"
			break;
			
			case _parede_externa:
				_objeto = obj_parede_externa
				_layer = "Paredes"
			break;
			
			case _parede_interna:
				_objeto = obj_parede_interna
				_layer = "Paredes"
			break;
		}
		
		if _objeto != noone
		{
			instance_create_layer(_l * _celula_largura, _a * _celula_altura, _layer, _objeto)
			show_debug_message(_layer)
		}
		instance_create_layer(_l * _celula_largura, _a * _celula_altura, "Chao", obj_chao)
	}
}

surface_free(_surf)

instance_create_layer(x, y, "UI", obj_ui_ingame)