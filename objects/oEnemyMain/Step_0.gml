//receive damage
if place_meeting(x, y, oDamageEnemy){
	// geting single damage instance (deprecated)
	#region
		//var _inst = instance_place(x, y, oDamageEnemy);
		//take damage from specifict instance
		//hp -= _inst.damage;
		// tell damage instance to destroy it self
		//_inst.destroy = true;
	#endregion
		
	// getting a list of the damage instance
	#region
		var _inst_list = ds_list_create(); // Trivia ds stand for DataSet. its kind of like array but more advance
		instance_place_list(x,y,oDamageEnemy,_inst_list,false);
		// get the size of our list
		var _list_size = ds_list_size(_inst_list);
		for(var _i = 0; _i < _list_size; _i++){
			//get damage object instance from the list
			var _inst = ds_list_find_value(_inst_list,_i);
			// check if instance is already in the damage list
			if ds_list_find_index(damage_list,_inst) == -1 {
				// add new damage instance to the damage list
				ds_list_add(damage_list,_inst);
				//take damage from specifict instance
				hp -= _inst.damage;
				// tell damage instance to destroy it self
				_inst.destroy = true;
			}
		}
		// u need this to prevent your device from out of ram (its kind of cleanup)
		ds_list_destroy(_inst_list);
	#endregion
		
}

// clear damage list of object that doesn't exist anymore or aren't touching pierce bullet anymore
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

//death
if hp <= 0 {instance_destroy(); }



