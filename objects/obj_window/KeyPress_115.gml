/// @description Change window size
	//Change the value and modulate it
	global.window_size += 1;
	
	//Reset
	if(global.window_size > global.window_size_limit) global.window_size = 1;
	
	//Call the resize event
	event_user(0);