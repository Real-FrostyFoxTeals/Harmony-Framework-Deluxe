/// @description Script
	//Update the animator
	animator_update(animator);
	
    //Set behind the player
    depth = obj_player.start_depth + 1;
	
    //Enter ring
    if(player_collide_object(C_MAIN) && !entered && active)
    {	
		//Player does not have all emeralds
		if(!all_emeralds) {
			//Set in front of the player
		    depth = obj_player.start_depth - 1;
		
			//Play vanish animation
			animation_play(animator, 1);
		
			//Change ring state
			state = 1;
		
			//Change destination room depending on emeralds already collected
			destination = rm_special_template; //asset_get_index("rm_re_special" + string(global.emerald_count + 1));
		
			entered = true;
		//Player has all emeralds
		} else { 
			//Set in front of the player
		    depth = obj_player.start_depth - 1;
		
			//Play vanish animation
			animation_play(animator, 1);
			
			//Give player rings
			global.rings += 50;
			play_sound(sfx_warp_ring);
			
			entered = true;
		}
    }
	
	//Warp sequence
	if(state = 1)
	{
		timer++;
		
		if(timer == 1)
		{
			play_sound(sfx_warp_ring);
		}
		
		//Hide the player and lock their position
		obj_player.state = player_state_null;
		obj_player.input_disable = true;
		obj_player.x_speed = 0;
		obj_player.y_speed = 0;
		obj_player.gravity_allow = false;
		obj_player.super_state = false;
		obj_player.visible = false;
		
		//Save ring position
		global.special_ring_x = x;
		global.special_ring_y = y;
		
		//Store player rings/shield
		global.bonus_rings = global.rings;
		global.bonus_shield = obj_player.shield;
		global.store_player_state.combinering = obj_player.combinering;
		
		//Store stage timer
		obj_level.disable_timer = true;
		global.time_store = global.stage_timer;
		
		//Store entrance ID so the ring doesn't activate again
		ds_list_add(global.special_ring, id);
		
		//Prioritize spawning the player at a special ring
		global.checkpoint_special_priority = 1;
		
		//Hide shield if player has one
		if(obj_player.shield)
		{
			par_shield.visible = false;
		}
		
		//Travel to special stage
		if(timer == 60) 
		{
			play_sound(sfx_warp_into);
			stop_music();
			fade_to_room(destination, 2, FADE_WHITE, 120);
		}
	}
	
	//Temp culling
	if(!on_screen(128, 128) && culling) instance_deactivate_object(id);