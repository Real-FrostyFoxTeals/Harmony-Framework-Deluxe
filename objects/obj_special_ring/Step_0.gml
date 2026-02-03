///@description Script
	//Update the animator
	animator_update(animator);
	
	//Set behind or in front of the player
    if(active) depth = obj_player.start_depth + 1; else depth = obj_player.start_depth - 1;
	
	// float up and dowwn slightly
	y = ystart + sin(global.object_timer * 0.05) * 2;
	
    //Touch entrance
    if(player_collide_object(C_MAIN) && active = true) {	
		//Set in front of the player
	    depth = obj_player.start_depth - 1;
		
		//Play vanish animation
		animation_play(animator, 1);
		
		//Change entrance state
		state = 1;
		entered = true;
    }
	
	//Entrance touched
	if(state = 1) {
		timer++;
		
		if(timer == 1) {
			play_sound(sfx_special_ring);
		}
		
		//If player doesn't have all emeralds
		if(!all_emeralds) {
			//Hide the player and lock their position
			obj_player.x_speed = 0;
			obj_player.y_speed = 0;
			obj_player.state = player_state_null;
			obj_player.input_disable = true;
			obj_player.gravity_allow = false;
			obj_player.visible = false;
			obj_player.x = x;
			obj_player.y = y;
			
			obj_hud.render = false;
			obj_level.disable_timer = true;	
			
			//Change destination room depending on emeralds already collected
			destination = rm_special_template //asset_get_index("rm_special_stage_" + string(global.emeralds + 1));
		
			//Hide shield if player has one
			if(obj_player.shield) {
				with(par_shield)
				{
					visible = false;
				}
			}
			
			//Save entrance position
			global.special_ring_x = x;
			global.special_ring_y = y;
			
			//Store player rings/shield.
			global.bonus_rings = global.rings;
			global.bonus_shield = obj_player.shield;
			
			//Store stage timer
			global.time_store = global.stage_timer;
			
			//Store entrance ID so the ring doesn't activate again
			ds_list_add(global.special_ring, id);
			
			//Prioritize spawning the player at a special ring
			global.checkpoint_special_priority = 1;
			
			//Warp to special stage
			if(timer = 60) {
				play_sound(sfx_warp);
				music_set_fade(FADE_OUT, 2);
				fade_to_room(destination, 1, FADE_WHITE);
			}
		} else { //If player has all emeralds
			if(timer == 1) global.rings += 50;
		}
	}
	
	//Temp culling
	if(!on_screen(64, 64) && culling && active) instance_deactivate_object(id);