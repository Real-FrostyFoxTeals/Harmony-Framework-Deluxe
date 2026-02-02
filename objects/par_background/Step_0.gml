    /*Setting up the background swapper*/
     if instance_exists(obj_bg_swapper) global.current_bg = id;
        
    /*Debugger*/
    if (set_slider)
    {
        set_slider = !set_slider;
        dbg_set_view(dbg_bg);
        dbg_set_section(dbg_bg_info)
        dbg_slider_int(dbg_layer_id, 0, array_length(background_sprite)-1, "Layer ID");
    }
    background_debugger_setup();