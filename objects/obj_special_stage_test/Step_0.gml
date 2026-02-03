if(Input.ActionPress && !active)
{
	play_sound(sfx_emerald)
	if(global.emeralds < 7) global.emeralds++;
	fade_to_room(global.last_visited_room, 1, c_black);
	music_set_fade(FADE_OUT, 2);
	active = true;
	global.bonus_return = true;
	global.bonus_rings = global.rings;
}

if(endstage = true)
{
	endstage = false;
	obj_player.x = global.special_ring_x;
	obj_player.y = global.special_ring_y;
}
