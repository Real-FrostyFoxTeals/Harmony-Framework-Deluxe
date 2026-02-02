    if (player_collide_object(C_MAIN)){
        with (global.current_bg){
            if ((obj_player.x_speed > 0 && other.horizontal) || (obj_player.y_speed > 0 && !other.horizontal))        instance_change(other.bg_RD, true);
            else if ((obj_player.x_speed < 0 && other.horizontal) || (obj_player.y_speed < 0 && !other.horizontal))   instance_change(other.bg_LU, true);
        }
    }
    if (!on_screen()) instance_deactivate_object(id);