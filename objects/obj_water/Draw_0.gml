/// @description Draw water 
    //Update image_index
    image_index += 0.7;
    
    if(ocean) 
    {
        image_xscale = room_width/16;
        image_yscale = room_height/16;
        x = 0;
    }
    
    draw_set_color(#5b301e);
    gpu_set_blendmode(bm_subtract);
    draw_rectangle(x, y, x + (image_xscale * 16), y + (image_yscale * 16), false);
    gpu_set_blendmode(bm_normal);
    draw_set_color(c_white);
		
    draw_sprite_ext(spr_water, image_index, x, y, image_xscale/4, 1, 0, c_white, 1);


