/// @description Draw water 

	//Camera position
	var cx, cy, sw, sh;
	cx = camera_get_view_x(view_camera[view_current])-64;
	cy = camera_get_view_y(view_camera[view_current])
	sw = global.window_width;
	sh = global.window_height;

	//Draw basic rectangle with blendmode
	draw_set_color($5b301e);
	gpu_set_blendmode(bm_subtract);

	if (!pool)  draw_rectangle(cx, max(y+1, cy), cx+sw+64, max(y+1, cy)+sh, false);
    else        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
    
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_white);
	
	//IMPORTANT NOTE!!
	//Enable this code if you wanna use shaders for color replacing instead of blend modes
	//You can either use palette_swap or set_color_grading
	
	/*
	//Draw whole ass water
	if(!surface_exists(surf)) surf = surface_create(global.window_width, global.window_height);
	
	//Draw shit in this
	surface_set_target(surf);
	
	//Draw tint surface
	gpu_set_blendenable(false);
	surface_copy(surf, 0, 0, application_surface);
	set_color_grading(yourlut, 17);

	//Done
	surface_reset_target();

	//Draw surface
	draw_surface_part(surf, 0,y-cy,426,cy,cx+64, y);
	shader_reset();
	gpu_set_blendenable(true);
	*/
	//Draw the water horizon
    image_index += 0.7;

	if (!pool) draw_sprite_ext(spr_water, image_index, x, y, sw+64, 1, 0, c_white, 1);
    draw_sprite_ext(spr_water, image_index, x, y, sprite_width/64, 1, 0, c_white, 1);