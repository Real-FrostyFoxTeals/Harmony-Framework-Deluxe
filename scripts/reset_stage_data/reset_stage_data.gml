function reset_stage_data(){
	global.checkpoint_id = noone;
	global.special_ring_x = 0;
	global.special_ring_y = 0;
	global.time_store = 0;
	global.rings = 0;
	global.cool_bonus = 0;
	global.stage_timer = 0;
	global.bonus_return = false;
	global.bonus_rings = 0;
	global.bonus_shield = 0;
	ds_list_clear(global.checkpoint);
	ds_list_clear(global.special_ring);
}