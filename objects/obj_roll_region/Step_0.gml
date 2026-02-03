/// @description Script // coded by legolloyd!
// Begin forced roll
if(player_collide_object(C_MAIN))
{
	//Play the sound
	if(obj_player.state != player_state_roll)
	{
		play_sound(sfx_roll);	
	}
	
	active = true;
	obj_player.force_roll = true;
	obj_player.state = player_state_roll;
}
// Exit forced roll
if(active && !player_collide_object(C_MAIN))
{
	active = false;
	obj_player.force_roll = false;	
}