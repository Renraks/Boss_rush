/// @description Etapas

image_alpha = opacidade

opacidade = lerp(opacidade, 1, 0.02)
//Aumenta o tamanho do aviso
image_xscale = lerp(image_xscale, escala_maxima, 0.02)
image_yscale = lerp(image_yscale, escala_maxima, 0.02)

vida--

if vida <= vida_max / 3
{
	image_speed = 1	
}
else
{
	image_speed = 0	
}

if vida <= 0 instance_destroy()
