// Use these to make ambient sounds with 2 easy steps!!
// 1. sound_emitter_play in the create event of an object, tune the variables to your like
// 2. put sound_emitter_update in the step event of the object, 
//    and set the sound to the one you played in the create! then set the x and y as you like.
// Presto! (not framework) you're done enjoy. - time
function sound_emitter_play(fullvol_distance = 484, max_distance = 1080, sound, X = x, Y = y)
{
	emitter = audio_emitter_create();

	// falloff harder then godamn drake
	audio_falloff_set_model(audio_falloff_exponent_distance_scaled);
	audio_emitter_falloff(emitter, fullvol_distance, max_distance, 1);

	//  set listener orientain
	audio_listener_orientation(0,0,-1, 0,1,0);

	// set emitter position
	audio_emitter_position(emitter, X, 0, Y);
	audio_listener_position(obj_camera.camera_x, 0, obj_camera.camera_y);

	// play drake
	if (global.amb_volume != 0)
	{
		sound_instance = audio_play_sound_on(emitter, sound, true, 1, global.amb_volume - 0.30)
		
		// volume 
		audio_sound_gain(sound_instance, global.amb_volume - 0.5, 10);
	};
}

function sound_emitter_update(sound,X = x, Y = y)
{
	// update properties
	audio_emitter_position(emitter, X, 0, Y);
	audio_listener_position(obj_camera.camera_x, 0, obj_camera.camera_y);

	// volume 
	if (global.amb_volume != 0)
	{
		audio_sound_gain(sound, global.amb_volume, 10);
	}
}