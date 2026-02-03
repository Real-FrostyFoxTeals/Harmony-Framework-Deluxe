/// @description Script
	x = floor(obj_player.x);
	y = floor(obj_player.y);
	
	if(!frames || obj_player.ground) instance_destroy();
    frames--;