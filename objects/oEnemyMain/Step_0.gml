//receive damage
if place_meeting(x, y, oDamageEnemy){
	var _inst = instance_place(x, y, oDamageEnemy);
	//take damage from specifict instance
	hp -= _inst.damage;
	// tell damage instance to destroy it self
	_inst.destroy = true;
}

//death
if hp <= 0 {instance_destroy(); }



