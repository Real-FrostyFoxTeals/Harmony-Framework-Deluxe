function play_sound(sound, loop = false, volume = 1.0){
	//Stop the audio before playing so it doesn't overlay
	audio_stop_sound(sound);
	
	//Play the sound
	audio_play_sound(sound, 0, loop);
	
	//Change the volume to match the global volume
	audio_sound_gain(sound, volume * global.sfx_volume, -1);
}