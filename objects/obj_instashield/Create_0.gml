/// @description Startup
    image_xscale = sign(obj_player.image_xscale);
    image_speed = 0.65;
    depth = obj_player.depth - 10;

    frames = 14;                         // timer for how long it stays active
	obj_player.instashield_used = true;  // prevents multiple uses