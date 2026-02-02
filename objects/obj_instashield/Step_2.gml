/// @description Script
	x = floor(Player.x);
	y = floor(Player.y);
	depth = Player.depth - 10;
	if(!Player.instashield_frames or image_index == 5) instance_destroy();