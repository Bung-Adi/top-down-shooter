//Move
	xspd = lengthdir_x(spd, dir);
	yspd = lengthdir_y(spd, dir);
	
	x += xspd;
	y += yspd;
	
	// collision
	if place_meeting(x, y, ObjectWallSolid){
		instance_destroy();
	}




