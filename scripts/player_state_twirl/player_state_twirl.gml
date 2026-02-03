function player_state_twirl(){
	//If its not in spring state exit
	if(state != player_state_twirl) exit;
	
	//Change state when falling
	if(ground)
	{
		state = player_state_normal;
	}
}