    var distance_to_player = distance_to_object(obj_player);
    if (!obj_player.collision_allow || (distance_to_player > 20)) exit;
        
    with (obj_player){
        if (x >= other.bbox_left && x <= other.bbox_right)
        {
            //Entering water
        	if((y >= other.y && y < other.bbox_bottom-sprite_height/2) || (y <= other.bbox_bottom && y > other.bbox_bottom-sprite_height/2))
        	{
        		//Player hitting the water
        		if(!underwater)
        		{
        			//Slow down the player
        			x_speed *= 0.5;
        			y_speed *= (y_speed > 0)? 0.25 : 1.25;
        			
        			//Create effects
        			if (y <= other.y+10) create_effect(x, other.y, spr_water_splash, 0.35, depth-1, 0, 0, 0, 0); 
        			
        			//Play sound
        			play_sound(sfx_water_splash);
        		}
                //Trigger the flag
        		underwater = true;
        	}
        	
        	//Exiting water
        	if((y < other.y && y < other.bbox_bottom-sprite_height/2) || (y > other.bbox_bottom && y > other.bbox_bottom-sprite_height/2))
        	{
        		//Player hitting the water
        		if(underwater)
        		{
        			//Speed up the player 
                    y_speed *= 1.25;
        			
        			//Create effects
        			if (y < other.y) create_effect(x, other.y, spr_water_splash, 0.35, depth-1, 0, 0, 0, 0); 
        			
        			//Play sound
        			play_sound(sfx_water_splash);
        		}
                //Trigger the flag
        		underwater = false;
        	}
            
        	//Aquaphobia
        	if(underwater && shield != S_BUBBLE)
        	{
        		//bubbles
        		if (bubble_delay > 0 && (air mod bubble_delay == 0)){
        			bubble_delay = 0
        			var bubble = instance_create_depth(x+6*facing, y-4, depth-1, obj_pool_bubble);
        			bubble.type = 0;	
        			bubble.angle = facing == -1 ? 180 : 0;
                    bubble.water_object = other;
        		}
        		
        		if(air mod 60 == 0 ){
        			var rand = round(random(1));
        			show_debug_message(rand);
        			if (rand == 0){
        				bubble_delay = irandom_range(6,16)*2
        			}
        			if (air < 20*60) {
        				var bubble = instance_create_depth(x+6*facing, y-4, depth-1, obj_pool_bubble);
        				bubble.type = 0;	
        				bubble.angle = facing == -1 ? 180 : 0;
                        bubble.water_object = other;
        			}
        			
        		}
        		
        		//Add air timer
        		air += 1;
        			
        		//Play warning sound
        		if(air == 6*60 || air == 12*60 || air == 18*60) play_sound(sfx_air_warning);
        			
        		//Uh oh drowning music
        		if(!audio_is_playing(j_drowning) && air == 20 * 60){
        			var jing = audio_play_sound(j_drowning, 0, false);
        			audio_sound_gain(jing, global.bgm_volume, 0);
        		}
        		
        	}else
        	{
        		air = 0;
        	}
        	
        	if(air < 20*60) audio_stop_sound(j_drowning);
        	
        	//Drown!
        	if(air > 32*60 && knockout_type != K_DROWN){
        		play_sound(sfx_drown);
        		obj_camera.mode = 99;
        		state = player_state_knockout;
        		knockout_type = K_DROWN;
        		x_speed = 0
        		y_speed = 0
        	}
        	//Create the countdown
            var create_countdown_bubble = function(animation_index = 0)
            {
                var animations = [spr_bubble_number_0,spr_bubble_number_1,spr_bubble_number_2,spr_bubble_number_3,spr_bubble_number_4,spr_bubble_number_5];
                var drown_bubble = instance_create_depth(x+6*facing, y-4, depth-10, obj_drown_bubble);
                drown_bubble.angle = facing == -1 ? 180 : 0;
                drown_bubble.animation = animations[animation_index];
            }
           
        	switch(air)
            {
        		case 20*60:
                    create_countdown_bubble(5);
        		break;
        				
        		case 22*60: 
                    create_countdown_bubble(4);
        		break;	
        				
        		case 24*60: 
                    create_countdown_bubble(3);
        		break;	
        				
        		case 26*60: 
                    create_countdown_bubble(2);
        		break;	
        				
        		case 28*60: 
                    create_countdown_bubble(1); 
                break;
        				
        		case 30*60: 
                    create_countdown_bubble(0);
        		break;	
        	}
        }
        else
        {
            if(underwater)
            { 
                y_speed *= 1.25; 
                if (y < other.y) create_effect(x, other.y, spr_water_splash, 0.35, depth-1, 0, 0, 0, 0); 
                play_sound(sfx_water_splash); 
            } 
            underwater = false;
        }
    }