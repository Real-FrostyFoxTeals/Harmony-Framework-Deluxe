/// @description Scripts
	
    	
    image_index += 0.7;
    
    if(player_collide_object(C_MAIN) && !pool) triggered = true;
    else triggered = false;
    
    if(triggered) {
        with(obj_player) {
            //Player hitting the water
    		if(!underwater)
    		{
    			//Slow down the player
    			x_speed *= 0.5;
    			y_speed *= 0.25;
    			
    			//Create effects
    			if(y < obj_water.y) create_effect(x, obj_water.y, spr_water_splash, 0.35);
    			
    			//Play sound
    			if(y < obj_water.y) play_sound(sfx_water_splash);
    		}
            
            //Trigger the flag
            underwater = true;
        }
    }else{
        with(obj_player) { 
            //Player hitting the water
    		if(underwater)
    		{
    			//Speed up the player
    			y_speed *= 1.25;
    			
    			//Create effects
    			if(y < obj_water.y) create_effect(x, obj_water.y, spr_water_splash, 0.35);
    			
    			//Play sound
    			if(y < obj_water.y) play_sound(sfx_water_splash);
    		}
    		
    		//Trigger the flag
    		underwater = false;
        }
    }