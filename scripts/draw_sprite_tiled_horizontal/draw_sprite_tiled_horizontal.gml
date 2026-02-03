function draw_sprite_tiled_horizontal(sprite, subimg, pos_x, pos_y, vertical = false, scale = 1, color = c_white, alpha = 1, clipped = false){
	var Width, Height, Left, Right, Bottom;
 
	Width = sprite_get_width(sprite);
	Height = sprite_get_height(sprite);
	Left  = -1;
	Right = camera_get_view_x(view_camera[view_current])/Width+global.window_width/Width+2;
	Bottom = camera_get_view_y(view_camera[view_current])/Height+global.window_height/Height+2;
	
	if(!vertical)
	{
		for(var i = Left; i <= Right; i++)
		{
			draw_sprite_ext(sprite, subimg, pos_x mod Width+Width*i, pos_y, 1, scale, 0, color, alpha);
		}
	}else
	{
		for(var i = Left; i <= Right; i++)
		{
			for(var j = -1; j <= Bottom; j++)
			{
				draw_sprite_ext(sprite, subimg, pos_x mod Width+Width*i, pos_y mod Height+Height*j, 1, scale, 0, color, alpha);
			}
		}		
	}
}

function draw_sprite_tiled_horizontal_part(sprite, subimg, left, top, width, height, pos_x, pos_y, color = c_white, alpha = 1, clipped = false){
	var Width, Height, Left, Right, Bottom;
 
	Width = sprite_get_width(sprite)*width;
	
    if (clipped) Height = height;
    else         Height = sprite_get_height(sprite);
        
	Left  = 0;
	Right = (Height==0)?0:camera_get_view_x(view_camera[view_current])/Width+global.window_width/Width+2;
	Bottom = (Height==0)?0:camera_get_view_y(view_camera[view_current])/Height+global.window_height/Height+2;
	
		for(var i = -1; i <= Bottom; i++)
		{
			draw_sprite_part_ext(sprite, subimg, Left, top, Width, Height, pos_x mod Width+Width*i, pos_y, 1, 1, color, alpha);
		}
}