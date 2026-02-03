/// @description Draw background
    for (var background_layer = 0; background_layer < bg_id; background_layer++){
        
        //Clamp layer setup
        if (background_clamp_base[background_layer]) clamp_base_layer = background_layer;
        
        //Clip layer setup
        if (background_clip_start[background_layer]) clip_start_layer = background_layer;
        if (background_clip_end[background_layer]) clip_end_layer = background_layer;
        
        //If clip layer hasn't started yet, continue drawing as usual; else, if clip layer has an ending layer set start drawing the cliped layers back to back
        if (clip_start_layer == -1){
            draw_background_layer(background_layer);
        }
        else if (clip_start_layer != -1 && clip_end_layer != -1){
            //Drawing the clip layers
                var surfaceclip = surface_create(global.window_width * global.camera_zoom, global.window_height * global.camera_zoom);
                var cx = camera_get_view_x(view_camera[view_current]);
	            var cy = camera_get_view_y(view_camera[view_current])
            
                surface_set_target(surfaceclip);
            
                for (var i = clip_start_layer; i <= clip_end_layer; i++){
                	draw_background_layer(i);
                    gpu_set_colourwriteenable(1,1,1,0);
                }
                gpu_set_colourwriteenable(1,1,1,1);
            
                surface_reset_target();
                draw_surface(surfaceclip, cx, cy);
            
            //Clean-up
                surface_free(surfaceclip);
                clip_start_layer = -1;
                clip_end_layer = -1;
        }
        
    	//Reset the shader
    	shader_reset();
        if (gpu_get_blendmode() != bm_normal)
        {
            gpu_set_blendmode(bm_normal);
            gpu_set_blendequation(bm_eq_add);
        }
        draw_set_alpha(1);
    }