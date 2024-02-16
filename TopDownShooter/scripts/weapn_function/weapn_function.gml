// weapon twempkawet qaksdjask djasd as
function create_wep(_sprite = AR, _weaponLength = 0, _bulletObj = ObjectBullet, _cooldown = 0.5 ) constructor {

sprite = _sprite;
length= _weaponLength;
bulletObj= _bulletObj;
cooldown= _cooldown;
}

global.PlayerWeapons = array_create(0);

global.weaponsList = {
	
	AR : new create_weapon(
	sAR,
	sprite_get_bbox_right( sAR ) - sprite_get_xoffset( sAR ),
	ObjectBullet,
	0.5
	
	),
	
	Shotgun : new create_weapon(
	sShotgun,
	sprite_get_bbox_right( sShotgun ) - sprite_get_xoffset( sShotgun ),
	ObjectBullet,
	10
	),
}
