/// @description Values 
// Credit: BriceTAS and FrostyFoxTeals
	culling = true;
	timer = 0;
	state = 0;
	plane = PLANE_A;
	entered = false;
	warp_timer = 0;
	destination = rm_special_template;
	
	//Check if player has all stones or not
	all_emeralds = global.emeralds == 7 ? true : false; 
	
	//Activate ring if it hasn't already been used
	active = ds_list_find_index(global.special_ring, id) = -1 ? true : false;
	
	//Create the animators
	animator = new animator_create();
	
	//Add animations
	animation_add(0, spr_special_ring, 1, 0, true, true);
	animation_add(1, spr_special_ring_dissapear, 2, 0, false, true);
	if(active) animation_play(animator, 0); else animation_play(animator, 1);