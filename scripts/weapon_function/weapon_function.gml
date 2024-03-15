// weapon template
function weapon_function(_sprite = Shotgun, _weaponLength = 0, _bulletObj = ObjectBullet, _cooldown = 1, _BulletNum = 1, _spread = 0)constructor{
	sprite = _sprite;
	length = _weaponLength;
	bullet_obj = _bulletObj;
	cooldown = _cooldown;
	bullet_num = _BulletNum;
	spread = _spread;
}

// Player Weapon Inventory
global.PlayerWeapon = array_create(0);

// the weapon
global.WeaponList = {
	AR : new weapon_function(
		spr_ar,
		sprite_get_bbox_right(spr_ar) - sprite_get_xoffset(spr_ar),
		obj_bullet,
		10,
		1,
		0
	),
	Shotgun : new weapon_function(
		spr_shotgun,
		sprite_get_bbox_right(spr_shotgun) - sprite_get_xoffset(spr_shotgun),
		obj_bullet_sg,
		30,
		5,
		45
	),
}