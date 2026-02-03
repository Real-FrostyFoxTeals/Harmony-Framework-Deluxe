depth = obj_player.depth + (dcos(spiral_timer-90)*sign(obj_player.x_speed));

if(obj_player.ground && player_collide_object(C_MAIN) && abs(obj_player.x_speed) >= 4)
{
	triggered = true;
	//obj_camera.limit_bottom = y+ WINDOW_WIDTH/2;
	//obj_camera.limit_top = y- WINDOW_WIDTH/2;
}

if(player_collide_object(C_MAIN) && abs(obj_player.x_speed) >= 4 && triggered)
{
	with(obj_player)
	{
		state = player_state_twirl;
		
		other.spiral_timer += abs(x_speed);
		y = other.y + other.spiral_height * dcos(other.spiral_timer - 24);
		
		//if(!animation_is_playing(animator, ANIM_ROLL))
		//{
		//	if(sign(x_speed) == 1) animation_play(obj_player.animator, ANIM_CORKSCREW); 
		//	else animation_play(obj_player.animator, ANIM_CORKSCREW);
			
		//	other.twist_angle = other.spiral_timer/other.spiral_lenght*360;
		//	other.player_twist_frame = (other.spiral_timer/other.spiral_lenght*12) mod 12;
			
		//	animation_set_speed(animator, 0);
			
		//	if(sign(x_speed) == 1)
		//	{
		//		animation_set_frame(animator, other.player_twist[other.player_twist_frame])
		//	}
		//	else
		//	{
		//		animation_set_frame(animator, other.player_twist_alt[12-other.player_twist_frame])
		//	}
		//}
		
		y_speed = 0;
		
		//if(state == player_state_twirl && !animation_is_playing(animator, ANIM_ROLL) && press_down)
		//{
		//	animation_play(animator, ANIM_ROLL)
		//	play_sound(sfx_roll);
		//}
		
		if(state == player_state_twirl && press_action)
		{
			other.triggered = false;
			state = player_state_jump();
			play_sound(sfx_jump);
			y_speed = -6 * dcos(other.spiral_timer - 24)
		}
	}
}
//else if(triggered == true)
//{
//	triggered = false;
//	with(Player)
//	{
//		if(animation_is_playing(animator, ANIM_ROLL))
//			state = player_state_roll;
		
//		if((animation_is_playing(animator, ANIM_CORKSCREW)) || (animation_is_playing(animator, ANIM_CORKSCREW)))
//		{
//			animation_set_speed(animator, 3);
//		}
//	}
	
//}

if(!triggered)
{
	spiral_timer = 0;
	player_twist_frame = 0;
}