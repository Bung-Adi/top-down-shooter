// get input key
var _right_key = keyboard_check(ord("D"));
var _left_key = keyboard_check(ord("A"));
var _up_key = keyboard_check(ord("W"));
var _down_key = keyboard_check(ord("S"));
var _shoot_key = mouse_check_button(mb_left);
var _swap_wep_key = mouse_check_button_pressed(mb_right);

get_damage(obj_damage_player,true);

// Player movement
	// get direction
	#region
		var _horizkey = _right_key - _left_key;
		var _vertkey = _down_key - _up_key;
		move_dir = point_direction(0,0,_horizkey,_vertkey);

		// get x & y speed
		var _spd = 0;
		var _input_level = point_distance(0,0,_horizkey,_vertkey);
		_input_level = clamp(_input_level,0,1);
		_spd = move_spd * _input_level;

		xspd = lengthdir_x(_spd,move_dir);
		yspd = lengthdir_y(_spd,move_dir);
	
		// collision with wall
		if place_meeting(x + xspd, y, obj_wall ){
			xspd = 0;
		}
		if place_meeting(x, y + yspd, obj_wall){
			yspd = 0;
		}

		// move the player
		x += xspd;
		y += yspd;
		
		// to fix depht
		depth = -bbox_bottom;
	#endregion

// Player Aim
	#region
		center_y = y + center_y_ofset
	
		// aim
		aim_dir = point_direction(x, center_y, mouse_x, mouse_y);
	#endregion

// Sprite Control
	// make sure player facing default direction
	#region
		face = round(aim_dir / 90); // prev: moce_dir
		if face == 4 {face = 0;};
	
		// stop animation when not press anyting
		if xspd == 0 && yspd == 0 {
			image_index = 0
		}
	
		// Set player sprite [warning its not fix sprite control facing right bug]
			// mask_index = sprite[3];
		sprite_index = sprite[face];
	#endregion
	
// Weapon Swaping
	#region
	var _player_weapon = global.PlayerWeapon;
	if _swap_wep_key{
		selected_weapon++;
		if selected_weapon >= array_length(_player_weapon) {selected_weapon = 0;};
		weapon = _player_weapon[selected_weapon];
	}
	#endregion
	
// Shooting
	if shoot_timer > 0 {shoot_timer--;}
	if _shoot_key && shoot_timer <= 0 {
		// reset timer
		shoot_timer = weapon.cooldown;
		
		// create bullet
		var _xoffset = lengthdir_x(weapon.length + weapon_offset_dist, aim_dir)
		var _yoffset = lengthdir_y(weapon.length + weapon_offset_dist, aim_dir)
		
		var _spread = weapon.spread;
		var _spread_div = _spread / weapon.bullet_num;
		
		// create the correct number of bullet
		for (var i = 0; i < weapon.bullet_num; i++){
			var _bullet_instance = instance_create_depth(x + _xoffset, center_y + _yoffset, depth-100, weapon.bullet_obj);
		
			// change bullet direction
			with(_bullet_instance){
				dir = other.aim_dir - _spread/2 + _spread_div*i;
			}
		}
	}

