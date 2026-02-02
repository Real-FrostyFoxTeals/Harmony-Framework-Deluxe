function add_background(sprite, frame, scroll_x, scroll_y, spd_x=0, spd_y=0, off_x=0, off_y=0, vertical_loop=false, animation_speed=0, blend_mode="normal", background_alpha=1, clip_base=false, clip_layer=false, clip_scale=false){
	background_sprite[bg_id] = sprite;
	background_frame[bg_id] = frame;
	factor_x[bg_id] = scroll_x;
	factor_y[bg_id] = scroll_y;
	speed_x[bg_id] = spd_x;
	speed_y[bg_id] = spd_y;
	offset_x[bg_id] = off_x;
	offset_y[bg_id] = off_y;
	background_vertical[bg_id] = vertical_loop;
	line_scroll[bg_id] = false;
	trigger[bg_id] = false;
	alpha[bg_id] = background_alpha;
    background_blend_mode[bg_id] = blend_mode;
    background_animation_speed[bg_id] = animation_speed;
    visibility[bg_id] = true;
    background_clip_base[bg_id] = clip_base;
    background_clip_layer[bg_id] = clip_layer;
    background_clip_yscale[bg_id] = clip_scale;
    
    default_attributes[bg_id] = [sprite, frame, scroll_x, scroll_y, spd_x, spd_y, off_x, off_y, vertical_loop,  animation_speed, blend_mode, background_alpha];
	bg_id++;
}

function add_background_line(sprite, frame, scroll_x, scroll_y, spd_x, spd_y, off_x, off_y, gaps, steps, y_scale=1, animation_speed=0, blend_mode="normal", background_alpha=1, clip_base=false, clip_layer=false, clip_scale=false){
	background_sprite[bg_id] = sprite;
	background_frame[bg_id] = frame;
	factor_x[bg_id] = scroll_x;
	factor_y[bg_id] = scroll_y;
	speed_x[bg_id] = spd_x;
	speed_y[bg_id] = spd_y;
	offset_x[bg_id] = off_x;
	offset_y[bg_id] = off_y;
	background_vertical[bg_id] = false;
	line_scroll[bg_id] = true;
	line_gap[bg_id] = gaps;
	line_steps[bg_id] = steps;
	bg_scale[bg_id] = y_scale;
	trigger[bg_id] = false;
	alpha[bg_id] = background_alpha;
    background_blend_mode[bg_id] = blend_mode;
    background_animation_speed[bg_id] = animation_speed;
    visibility[bg_id] = true;
    background_clip_base[bg_id] = clip_base;
    background_clip_layer[bg_id] = clip_layer;
    background_clip_yscale[bg_id] = clip_scale;
	bg_id++;
}