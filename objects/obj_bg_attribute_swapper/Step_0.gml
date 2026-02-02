    if (player_collide_object(C_MAIN)){
        with (global.current_bg){
            if ((obj_player.x_speed > 0 && other.horizontal) || (obj_player.y_speed > 0 && !other.horizontal)) attribute_number = other.switch_to_RD;
            else if ((obj_player.x_speed < 0 && other.horizontal) || (obj_player.y_speed < 0 && !other.horizontal)) attribute_number = other.switch_to_LU;
        }
    }
    if (!on_screen()) instance_deactivate_object(id);