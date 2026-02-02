/// @description Draw debug
/// @description Draw debug
	//Draw hitboxes
	if(show_hitbox)
	{
        for(var i = 0; i < draw_ind; i++)
        {
            with(draw[i][0])
            {
                switch(other.draw[i][1])
                {
                    case "point":
                        draw_sprite_ext(spr_point, 0, other.draw[i][2], other.draw[i][3], 1, 1, 0, other.draw[i][4], 1);
                    break;
                    
                    case "line":
                        draw_line_color(other.draw[i][2], other.draw[i][3], other.draw[i][4], other.draw[i][5], other.draw[i][6], other.draw[i][6]);
                    break;
                    
                    case "rectangle":
                        draw_set_alpha(other.draw[i][7]);
                        draw_rectangle_color(other.draw[i][2], other.draw[i][3], other.draw[i][4], other.draw[i][5], other.draw[i][6], other.draw[i][6], other.draw[i][6], other.draw[i][6], false);
                        draw_set_alpha(1);
                    break;
                }
            }
        }
        
        with(all)
		{
			if(object_index != obj_player && object_index != obj_effect && object_index != obj_dust_effect)	
			{
				if(object_index = par_solid) exit
				draw_set_color(c_blue);
				draw_set_alpha(0.5);
				draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
				draw_set_alpha(1);
				draw_set_color(c_white);
			}
		}
	}
    
    //Reset for overwritting
    draw_ind = 0;
	
	//Create surface
	if(!surface_exists(surf)) surf = surface_create(global.window_width, global.window_height);
			
	if(show_player && !debug && instance_exists(obj_player))
	{
		//Set surface target
		surface_set_target(surf);
		draw_clear_alpha(c_black, 0);
		
		draw_set_font(global.font_small);
		
		//Reset surface target
		surface_reset_target();
		
		//Draw surface
		draw_surface(surf, camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]))	
		
		//Draw hitbox
		draw_set_color(c_red);
		draw_set_alpha(0.7);
		draw_rectangle(floor(obj_player.x)-obj_player.wall_w - obj_player.hitbox_left_offset, floor(obj_player.y)-obj_player.hitbox_h - obj_player.hitbox_top_offset, floor(obj_player.x)+obj_player.wall_w + obj_player.hitbox_right_offset, floor(obj_player.y)+obj_player.hitbox_h + obj_player.hitbox_bottom_offset, false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		
		//Draw main sensors
		with(obj_player)
		{
			draw_set_color(#ff38ff);
			draw_col_line_wall(-wall_h, -wall_w-1)
			draw_set_color(#ff5454);
			draw_col_line_wall(-wall_h, wall_w)
			draw_set_color(#38ffa2);
			draw_col_line(-hitbox_w, hitbox_h);
			draw_set_color(#00f000);
			draw_col_line(hitbox_w, hitbox_h);
			draw_set_color(c_white);
			draw_col_line(0, hitbox_h);
			draw_set_color(#00aeef);
			draw_col_line(-hitbox_w, -hitbox_h-1);
			draw_set_color(#fff238);
			draw_col_line(hitbox_w, -hitbox_h-1);
			draw_set_color(c_white);
			
			draw_sprite(spr_point, 0, floor(x), floor(y));
			
			if(shield = S_ELECTRIC) draw_circle(floor(x), floor(y), 64, true);
		}
	}
	
	if(show_fps)
	{
		//Set surface target
		surface_set_target(surf);
		draw_clear_alpha(c_black, 0);
		
		//Draw text in rectangle
		draw_set_font(global.font_small);
		draw_set_halign(fa_left);
		draw_text(0, global.window_height-8, "FPS: " + string(fps) + " " + "TRUE FPS:" +string(store_truefps));
		draw_text(0, global.window_height-16, "INSTANCES: " + string(instance_count));
		
		//Reset surface target
		surface_reset_target();
		
		//Draw surface
		draw_surface(surf, camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]))	
	}
	//Disable not in debug mode
	if(!debug || !instance_exists(obj_player)) exit;
	
	draw_set_alpha(0.75);
	var sprite = object_get_sprite(object_list[object_select]);
	draw_sprite(sprite, 0, mouse_x, mouse_y);
	draw_set_alpha(1);
	
	//Set surface target
	surface_set_target(surf);
	draw_clear_alpha(c_black, 0);
	
	//Draw text in rectangle
	draw_set_font(global.font_small);
	draw_set_halign(fa_left);
	draw_text(0, 0, string_upper(window_get_caption()) +" "+ string(GM_version));
	draw_text(0, 8, "BUILD DATE: " + date_date_string(GM_build_date));
	draw_text(0, 16, "BUILD TIME: " + date_time_string(GM_build_date));
	
	//Draw info
	draw_set_halign(fa_right);
	draw_text(global.window_width, 0,"PLAYER: " + string(floor(obj_player.x)) + " " + string(floor(obj_player.y)));
	draw_text(global.window_width, 8,"CAMERA: " + string(floor(obj_camera.camera_x)) + " " + string(floor(obj_camera.camera_y)));
	draw_text(global.window_width, 16,"CANVAS: " + string(room_width) + " " + string(room_height));
	
	surface_reset_target()
	
	draw_set_halign(fa_center);
	draw_text(mouse_x, mouse_y-32, string_upper(object_get_name(object_list[object_select])));
	
	//Draw surface
	draw_surface(surf, camera_get_view_x(view_camera[view_current]), camera_get_view_y(view_camera[view_current]))	