/// @description Values		
	//Change animation speed
	image_speed = 0.3;
	bubble_sets = [[0,0,0,0,1,0],[0,1,0,0,0,0],[1,0,1,0,0,0],[0,1,0,0,1,0]]
	time = 0
	cycle = 0
	cycle_size = 0
	time_until = 0
	cycle_index = 0
	cycle_set_index = 0
	spawned_big = false
	is_emitting = false

    if (place_meeting(x, y, obj_water_pool)) bubble_obj = obj_pool_bubble;
    else bubble_obj = obj_bubble;