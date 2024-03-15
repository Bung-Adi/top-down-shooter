// draw player weapon
function draw_my_weapon(){
	// get weapon off the player body
	var _x_offset = lengthdir_x(weapon_offset_dist,aim_dir);
	var _y_offset = lengthdir_y(weapon_offset_dist,aim_dir);

	// flip weapon in upright
	var _weapon_y_scale = 1;
	if aim_dir > 90 && aim_dir < 270{
		_weapon_y_scale = -1;
	}
	draw_sprite_ext(weapon.sprite, 0, x + _x_offset, center_y + _y_offset, 1, _weapon_y_scale, aim_dir, c_white, 1);
}

// Damage calculation
	// Damage create event
	function get_damage_create(_hp=10,_iframe = false){
		hp = _hp;
		// get iframe
		if _iframe == true{
			iframe_timer = 0;
			iframe_number = 90;
		}
		if _iframe == false{
			damage_list = ds_list_create();
		}
	}
	
	// Damage cleanup
	// DOESN NEEDED IF using IFrame
	function get_damage_cleanup(){
		ds_list_destroy(damage_list);
	}
	
	// Damage step event
	function get_damage(_damage_object,_iframe = false){
		
	// Special exit iframe timer
	if _iframe == true && iframe_timer > 0 {
		iframe_timer--;
		if iframe_timer mod 5 == 0 {
			if image_alpha == 1 {
				image_alpha = 0;
			} else {
				image_alpha = 1;
			}
		}
		exit;
	}
	// make sure iframe blinking stop
	if _iframe == true {
		image_alpha = 1;
	}
	
	// receive damage
		if place_meeting(x, y, _damage_object){
			// getting a list of the damage instance
			#region
				var _inst_list = ds_list_create(); // Trivia ds stand for DataSet. its kind of like array but more advance
				instance_place_list(x,y,_damage_object,_inst_list,false);
				// get the size of our list
				var _list_size = ds_list_size(_inst_list);
				var _hit_confirm = false;
				for(var _i = 0; _i < _list_size; _i++){
					//get damage object instance from the list
					var _inst = ds_list_find_value(_inst_list,_i);
					// check if instance is already in the damage list
					if _iframe == true || ds_list_find_index(damage_list,_inst) == -1 {
						// add new damage instance to the damage list
						if _iframe == false {
							ds_list_add(damage_list,_inst);
						}
						//take damage from specifict instance
						hp -= _inst.damage;
						_hit_confirm = true;
						// tell damage instance to destroy it self
						_inst.hit_confirm = true;
					}
				}
				
				if _iframe == true && _hit_confirm {
					iframe_timer = iframe_number;
				}
				
				// u need this to prevent your device from out of ram (its kind of cleanup)
				ds_list_destroy(_inst_list);
			#endregion
		}

	// clear damage list of object that doesn't exist anymore or aren't touching pierce bullet anymore
		if _iframe == false {
			var _damage_list_size = ds_list_size(damage_list);
			for(var _i = 0; _i < _damage_list_size; _i++){
				// if not touching damage instance anymore, remove ut from the list AND set the loop back 1 position
				var _inst = ds_list_find_value(damage_list,_i);
				if !instance_exists(_inst) || !place_meeting(x,y,_inst){
					ds_list_delete(damage_list,_i);
					_i--;
					_damage_list_size--;
				}
			}
		}
	}