/// @description Values
	
	background_sprite = [];
	background_frame = [];
	factor_x = [];
	factor_y = [];
	offset_x = [];
	offset_y = [];
	speed_x = [];
	speed_y = [];
	pos_x = [];
	pos_y = [];
	background_vertical = [];
	line_scroll = [];
	line_gap = [];
	line_steps = [];
	bg_scale = [];
	diff_x = [];
	diff_y = [];
	trigger = [];
    alpha = [];
    background_blend_mode = [];
    background_animation_speed = [];
    visibility = [];
    background_clip_base = [];
    background_clip_layer = [];
    background_clip_yscale = [];

    clip_base_layer = 0;

	bg_id = 0;
    attribute_number = 0;
    default_attributes = [];

    function background_debugger_setup(){
        dbg_set_view(dbg_bg);
        if (layer_id != hold_id)
        {
            hold_id = layer_id;
            set_debuger_values();
            
            dbg_section_delete(dbg_bg_values);
            dbg_bg_values = dbg_section("Background Values for Layer "+string(layer_id)+":", true);
            
            dbg_text("\Layer Sprite:"+sprite_get_name(background_sprite[layer_id])+"\n\n");
            dbg_slider(dbg_frame, 0, sprite_get_number(background_sprite[layer_id]), "Layer Frame");
            dbg_slider(dbg_factor_x, 0, 1, "Factor X");
            dbg_slider(dbg_factor_y, 0, 1, "Factor Y");
            dbg_slider(dbg_offset_x, -300, 6000, "Offset X");
            dbg_slider(dbg_offset_y, -300, 6000, "Offset Y");
            dbg_slider(dbg_speed_x, -10, 10, "Speed X");
            dbg_slider(dbg_speed_y, -10, 10, "Speed Y");
            dbg_checkbox(dbg_bg_vertical, "Vertical Background");
            
            if (line_scroll[layer_id])
            {
                dbg_text("\n\nThese values are for tweaking Line Scroll type layers...\n");
                dbg_slider(dbg_line_gap, 0, 1, "Line Gap");
                dbg_slider(dbg_line_steps, 0, 1, "Line Steps");
                dbg_text("\n\n");
            }
            
            dbg_slider(dbg_alpha, 0, 1, "Alpha");
            dbg_text_input(dbg_bg_blend_mode,"Blend Mode");
            dbg_slider(dbg_bg_anim_speed, -10, 10, "Animation Speed");
            dbg_checkbox(dbg_visibility, "Visibility");
            dbg_checkbox(dbg_bg_clip_base, "Clip Base");
            dbg_checkbox(dbg_bg_clip_layer, "Clip Layer");
            dbg_checkbox(dbg_bg_clip_yscale, "Clip YScale");
        }
    }
    function set_debuger_values(){
        dbg_layer_id = ref_create(self, "layer_id");
        dbg_frame = ref_create(self, "background_frame", layer_id);
        dbg_factor_x = ref_create(self, "factor_x", layer_id);
    	dbg_factor_y = ref_create(self, "factor_y", layer_id);
        dbg_offset_x = ref_create(self, "offset_x", layer_id);
    	dbg_offset_y = ref_create(self, "offset_y", layer_id);
    	dbg_speed_x = ref_create(self, "speed_x", layer_id);
    	dbg_speed_y = ref_create(self, "speed_y", layer_id);
        dbg_bg_vertical = ref_create(self, "background_vertical", layer_id);
        dbg_line_gap = ref_create(self, "line_gap", layer_id);
        dbg_line_steps = ref_create(self, "line_steps", layer_id);
    	dbg_alpha = ref_create(self, "alpha", layer_id);
        dbg_bg_blend_mode = ref_create(self, "background_blend_mode", layer_id);
        dbg_bg_anim_speed = ref_create(self, "background_animation_speed", layer_id);
        dbg_visibility = ref_create(self, "visibility", layer_id);
        dbg_bg_clip_base = ref_create(self, "background_clip_base", layer_id);
        dbg_bg_clip_layer = ref_create(self, "background_clip_layer", layer_id);
        dbg_bg_clip_yscale = ref_create(self, "background_clip_yscale", layer_id);
    }

    dbg_bg = dbg_view("Background "+string(object_get_name(self.object_index)), false, -1, -1, 850, 550);
    dbg_bg_info = dbg_section("Background Object Info", true);
    dbg_text("This menu is used for testing and setting up the various attributes of the current active background in the room.\nTo change the layer of the attributes you are testing change the background layer number down bellow.\n\n");
    
    layer_id        = 0;
    hold_id         = -1;
    set_slider      = true;
    dbg_bg_values   = NaN;
    set_debuger_values();