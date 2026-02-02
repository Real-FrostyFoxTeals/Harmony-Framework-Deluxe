function dev_draw_point(x, y, color = c_white)
{
    //Get the dev handler
    var d = obj_dev;
    
    //If the dev object doesn't exist, don't execute
    if(!instance_exists(obj_dev)) exit;
    
    //Set it up NOW
    d.draw[d.draw_ind][0] = id;
    d.draw[d.draw_ind][1] = "point";
    d.draw[d.draw_ind][2] = x;
    d.draw[d.draw_ind][3] = y;
    d.draw[d.draw_ind][4] = color;
    d.draw_ind++;
}

function dev_draw_line(x1, y1, x2, y2, color = c_white)
{
    //Get the dev handler
    var d = obj_dev;
    
    //If the dev object doesn't exist, don't execute
    if(!instance_exists(obj_dev)) exit;
    
    //Set it up NOW
    d.draw[d.draw_ind][0] = id;
    d.draw[d.draw_ind][1] = "line";
    d.draw[d.draw_ind][2] = x1;
    d.draw[d.draw_ind][3] = y1;
    d.draw[d.draw_ind][4] = x2;
    d.draw[d.draw_ind][5] = y2;
    d.draw[d.draw_ind][6] = color;
    d.draw_ind++;
}

function dev_draw_rectangle(x1, y1, x2, y2, color = c_white, alpha = 0.5)
{
    //Get the dev handler
    var d = obj_dev;
    
    //If the dev object doesn't exist, don't execute
    if(!instance_exists(obj_dev)) exit;
    
    //Set it up NOW
    d.draw[d.draw_ind][0] = id;
    d.draw[d.draw_ind][1] = "rectangle";
    d.draw[d.draw_ind][2] = x1;
    d.draw[d.draw_ind][3] = y1;
    d.draw[d.draw_ind][4] = x2;
    d.draw[d.draw_ind][5] = y2;
    d.draw[d.draw_ind][6] = color;
    d.draw[d.draw_ind][7] = alpha;
    d.draw_ind++;
}