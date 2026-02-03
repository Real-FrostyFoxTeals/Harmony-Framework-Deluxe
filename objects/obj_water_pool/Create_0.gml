    anim_water = 0;
    anim_caustic = 0;

    pocket_run = instance_create_depth(obj_player.x, y, depth, obj_water_pool_run);
    pocket_run.water_object = id;