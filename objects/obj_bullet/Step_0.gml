//Move
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);
	
	x += xspd;
	y += yspd;
	
//Cleanup
	// hit confirm
	if hit_confirm == true && enemy_destroy_bullet == true {destroy = true;};
	// collision & nullified bullet
	if destroy == true {
		instance_destroy();
	}
	if place_meeting(x, y, obj_wall_solid){
		destroy = true;
	}
	//nullified bullet if out of range
	if point_distance(xstart,ystart,x,y) > max_dist {
		instance_destroy();
	}