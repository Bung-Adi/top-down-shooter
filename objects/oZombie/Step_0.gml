// chase player
	if instance_exists(ObjectPlayer){
		dir = point_direction(x, y, ObjectPlayer.x, ObjectPlayer.y);
	}
	
	// geting the speed
	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	
	// get correct facing
	if xspd > 0 { face = 1;}
	if xspd < 0 { face = -1;}
	//image_xscale = face;
	
	// collision
	if place_meeting(x + xspd, y, ObjectWall) or place_meeting(x + xspd, y, oEnemyMain) { xspd = 0; }
	if place_meeting(x, y + yspd, ObjectWall) or place_meeting(x, y + yspd, oEnemyMain) { yspd = 0; }
	
	//moving
	x += xspd;
	y += yspd;


// Inherit the parent event
	// geting damage and die
	event_inherited();

