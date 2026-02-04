    if (player_collide_object(C_MAIN) && ((obj_player.x > x && activation_dir == "Right") || 
                                          (obj_player.y > y && activation_dir == "Down")  ||
                                          (obj_player.x < x && activation_dir == "Left")  ||
                                          (obj_player.y < y && activation_dir == "Up")))  { move_water = true; }

    if (move_water)
    {
        ease = clamp(ease + change_speed, 0, 1);
        
        if (!water.is_pool || (water.is_pool && ((water.ystart + move_height) > water.bbox_bottom)))
        {
            water.y = water.ystart + move_height * easeInOutCubic(ease);
        }
        else if (water.is_pool)
        {
            water.y = water.ystart + move_height * easeInOutCubic(ease);
            water.image_yscale = (hold_bbox_bottom - water.y)/64
        }
        
        if (water.y == move_height) move_water = false;
    }

    if (!on_screen()) instance_deactivate_object(id);