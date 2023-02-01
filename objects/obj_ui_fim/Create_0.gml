/// @description Insert description here
// You can write your code in this editor

temporizador = room_speed * 2
opacidade_enter = 0

function reiniciar()
{
	var reinicia 
	reinicia = keyboard_check_pressed(vk_enter)
	
	if reinicia
	{
		game_restart()	
	}
}

audio_play_sound(snd_Sheeesh, 1, false)


