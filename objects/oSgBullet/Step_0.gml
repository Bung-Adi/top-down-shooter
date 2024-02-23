//Move
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);
	
	x += xspd;
	y += yspd;
	
	// collision & nullified bullet
	if destroy == true {
		instance_destroy();
	}
	if place_meeting(x, y, ObjectWallSolid){
		destroy = true;
	}
	//nullified bullet if out of range
	if point_distance(xstart,ystart,x,y) > max_dist {
		instance_destroy();
	}