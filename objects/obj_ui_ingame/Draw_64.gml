/// @description Render

draw_set_color(c_white)
//Desenha a sprite de cooldown do dash
draw_sprite_ext(spr_cooldown, 0, 50, 50, 1, 1, 0, c_white, alpha_dash)
draw_sprite_ext(spr_cooldown, 1, 50, 100, 1, 1, 0, c_white, alpha_tiro)

draw_set_font(fnt_titulo)
if jogador.cooldown_dash draw_text(100, 50, cooldown_dash)
if jogador.cooldown_ataque_ad draw_text(100, 100, cooldown_tiro)

