/// @description Values
	screen_width = (global.window_width)/sprite_get_width(sprite_index);
	surf = surface_create(global.window_width, global.window_height);
	surf_bg = surface_create(global.window_width, global.window_height);

    if (!is_pool) x = 0;

    //Water run object
	var water_run = instance_create_depth(x, y, 0, obj_water_run);
    water_run.water = self;