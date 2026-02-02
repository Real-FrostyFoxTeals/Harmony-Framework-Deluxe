/// @description Draw background
    for (var background_layer = 0; background_layer < bg_id; background_layer++){
        //Apply blend mode to the background
        switch (background_blend_mode[background_layer])
        {
            case "lighten":
                gpu_set_blendmode_ext(bm_one, bm_dest_color);
                gpu_set_blendequation_sepalpha(bm_eq_max, bm_eq_add);
                gpu_set_alphatestenable(true);
            break;
            case "darken":
                gpu_set_blendmode_ext(bm_one, bm_dest_color);
                gpu_set_blendequation_sepalpha(bm_eq_min, bm_eq_add);
                gpu_set_alphatestenable(true);
            break;
            case "addition":
                gpu_set_blendmode(bm_add);
            break;
            case "multiply":
                gpu_set_blendmode_ext(bm_zero, bm_src_color);
                gpu_set_alphatestenable(true);
            break;
        }
        
        //Frame increase for animated backgrounds
        if (background_animation_speed[background_layer] != 0) background_frame[background_layer] += background_animation_speed[background_layer];
        
        //Clip layer setup
        if (background_clip_base[background_layer]) clip_base_layer = background_layer;
        
        draw_background_layer(background_layer);
        
    	//Reset the shader
    	shader_reset();
        if (background_blend_mode[background_layer] != "normal")
        {
            gpu_set_blendmode(bm_normal);
            gpu_set_blendequation(bm_eq_add);
        }
        if (background_clip_layer[background_layer]) gpu_set_alphatestenable(false);
        draw_set_alpha(1);
    }