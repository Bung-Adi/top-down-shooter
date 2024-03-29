// chase player
	if instance_exists(obj_player){
		dir = point_direction(x, y, obj_player.x, obj_player.y);
	}
	
	// geting the speed
	xspd = lengthdir_x(spd,dir);
	yspd = lengthdir_y(spd,dir);
	
	// get correct facing
	if xspd > 0 { face = 1;}
	if xspd < 0 { face = -1;}
	//image_xscale = face;
	
	// collision
	if place_meeting(x + xspd, y, obj_wall) or place_meeting(x + xspd, y, obj_enemy_main) { xspd = 0; }
	if place_meeting(x, y + yspd, obj_wall) or place_meeting(x, y + yspd, obj_enemy_main) { yspd = 0; }
	
	//moving
	x += xspd;
	y += yspd;


// Inherit the parent event
	// geting damage and die
	event_inherited();

