    var cx, cy, collide;
	cx = camera_get_view_x(view_camera[view_current])+global.window_width/2;
	cy = camera_get_view_y(view_camera[view_current])+global.window_height/2;
	collide = point_in_rectangle(cx,cy,bbox_left,bbox_top,bbox_right,bbox_bottom);

    if (collide){
        with (global.current_bg){
            if ((cx > x && other.activation_dir == "Right") ||
                (cy > y && other.activation_dir == "Down")  ||
                (cx < x && other.activation_dir == "Left")  ||
                (cy < y && other.activation_dir == "Up"))   { instance_change(other.new_bg, true); } 
        }
    }
    if (!on_screen()) instance_deactivate_object(id);