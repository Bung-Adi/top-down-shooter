// weapon template
function weapon_function(_sprite = Shotgun, _weaponLength = 0, _bulletObj = ObjectBullet, _cooldown = 1)constructor{
	sprite = _sprite;
	length = _weaponLength;
	bullet_obj = _bulletObj;
	cooldown = _cooldown;
}

// Player Weapon Inventory
global.PlayerWeapon = array_create(0);

// the weapon
global.WeaponList = {
	AR : new weapon_function(
		sAR,
		sprite_get_bbox_right(sAR) - sprite_get_xoffset(sAR),
		ObjectBullet,
		0.5
	),
	Shotgun : new weapon_function(
		sShotgun,
		sprite_get_bbox_right(sShotgun) - sprite_get_xoffset(sShotgun),
		ObjectBullet,
		40
	),
}