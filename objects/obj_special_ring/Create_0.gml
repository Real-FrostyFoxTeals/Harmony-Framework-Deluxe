/// @description Values
	culling = true;
	timer = 0;
	state = 0;
	all_emeralds = false;
	entered = false;
	
	//Activate ring if it hasn't already been used
	active = ds_list_find_index(global.special_ring, id) = -1 ? true : false;
	
	//Create the animator
	animator = new animator_create();
	
	//Add animations
	animation_add(0, spr_warpring_normal, 5, 0, true, true);
	animation_add(1, spr_warpring_vanish, 2, 0, false, true);
	if(active) animation_play(animator, 0); else animation_play(animator, 1);