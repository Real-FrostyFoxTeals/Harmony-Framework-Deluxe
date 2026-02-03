/// @description Stage start
	//Play stage music
	play_music(stage_music, 0);
	
	//Reset stage data
	global.stage_timer = 0;
	
	//Position player to the checkpoint
	if(global.checkpoint_id != noone && instance_exists(global.checkpoint_id) && global.checkpoint_special_priority == 0)
	{
		obj_player.x = global.checkpoint_id.x;
		obj_player.y = global.checkpoint_id.bbox_bottom - obj_player.hitbox_h;
		obj_camera.target_x = obj_player.x;
		obj_camera.target_y = obj_player.y-16;
		global.stage_timer = global.time_store;
        
        if(instance_exists(obj_bg_swapper)){
            with (global.current_bg) instance_change(global.background_store, true);
        }
	}
	
	//Position player to the special stage entrance
	if(global.special_ring_x != 0 && global.special_ring_y != 0 && global.special_ring != noone && global.checkpoint_special_priority = 1) 
	{
		obj_player.x = global.special_ring_x;
		obj_player.y = global.special_ring_y;
		obj_camera.target_x = obj_player.x;
		obj_camera.target_y = obj_player.y-16;
		global.stage_timer = global.time_store;
		if(global.bonus_return == true)
		{
			global.rings = global.bonus_rings;
			obj_player.shield = global.bonus_shield;
			global.bonus_return = false;
		}
		
		if(instance_exists(obj_bg_swapper)){
            with (global.current_bg) instance_change(global.background_store, true);
        }
	}
	
	if !ds_map_exists(global.red_ring_map,stage_name) {
		ds_map_add(global.red_ring_map,stage_name,array_create(red_ring_count))
	}

	if (red_ring_count > 10) || (instance_number(obj_red_ring) > 10) || (instance_number(obj_red_ring) > red_ring_count) {
		throw "Red Ring count exceeds maximum count of " + string(min(red_ring_count,10));	
	}

	if (instance_number(obj_emerald_shard) == 0 && is_emerald_hunt) {
		throw "No Emeralds present for the emerald hunt";	
	}
	if (is_emerald_hunt) {
		if (emerald_hunt_randoms > emerald_hunt_total) {
			throw "Random emeralds exceeds the total count of " + string(emerald_hunt_total);	
		}
		if (emerald_hunt_total > 10) || (instance_number(obj_emerald_shard) > 10) || (instance_number(obj_emerald_shard) > emerald_hunt_total) {
			throw "Emerald shard count exceeds maximum count of " + string(min(emerald_hunt_total,10));	
		}
	}
