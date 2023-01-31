/// @description Insert description here
// You can write your code in this editor

if(!ivulneravel) draw_sprite_ext(spr_player, 0, x, y, 1, 1, 0, c_white, image_alpha);
else draw_self();

for (var i = 1; i <= vida; i ++)
{
	draw_sprite_ext(spr_vida, 0, room_width - 30 - (50 * i), 50, 5, 5, 0, c_white, 1)
}