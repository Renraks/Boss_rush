/// @description Insert description here
// You can write your code in this editor

image_alpha = opacidade

opacidade = lerp(opacidade, 1, 0.05)
//Aumenta o tamanho do aviso
image_xscale = lerp(image_xscale, escala_maxima, 0.01)
image_yscale = lerp(image_yscale, escala_maxima, 0.01)

vida--

if vida <= 0 instance_destroy()