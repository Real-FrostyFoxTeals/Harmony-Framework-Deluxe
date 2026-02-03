    anim_water += 0.7 / 4;

    draw_set_color($FF031161);
	gpu_set_blendmode(bm_subtract);
	draw_rectangle(bbox_left, bbox_top+2, bbox_right, bbox_bottom, false);
	gpu_set_blendmode(bm_normal);
	draw_set_color(c_white);

    draw_sprite_ext(spr_water, anim_water, x, y-4, sprite_width/64, (sprite_height+4)/256, 0, c_white, 1);