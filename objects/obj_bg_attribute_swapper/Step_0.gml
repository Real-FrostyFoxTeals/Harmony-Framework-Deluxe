    var cx, cy, collide;
	cx = camera_get_view_x(view_camera[view_current])+global.window_width/2;
	cy = camera_get_view_y(view_camera[view_current])+global.window_height/2;
	collide = point_in_rectangle(cx,cy,bbox_left,bbox_top,bbox_right,bbox_bottom);

    if (collide){
        with (global.current_bg){
            if ((cx > x && other.horizontal) || (cy > 0 && !other.horizontal)) attribute_number = other.switch_to_RD;
            else if ((cx < 0 && other.horizontal) || (cy < 0 && !other.horizontal)) attribute_number = other.switch_to_LU;
        }
    }
    if (!on_screen()) instance_deactivate_object(id);