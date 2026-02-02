/// @description Script
	x = floor(obj_player.x);
	y = floor(obj_player.y);
	depth = obj_player.depth - 10;
	if(!obj_player.instashield_frames or image_index == 5) instance_destroy();