move_dir = 0;
move_spd = 2;
xspd = 0;
yspd = 0;

// global aiming and center weapon holding
center_y_ofset = 12;
center_y = y + center_y_ofset
aim_dir = 0;

weapon_offset_dist = 4;

// Sprite Array
face = 3;
sprite[0] = SpritePlayerRight;
sprite[1] = SpritePlayerUp;
sprite[2] = SpritePlayerLeft;
sprite[3] = SpritePlayerDown;

// Weapon info
shoot_timer = 0;
array_push(global.PlayerWeapon, global.WeaponList.AR, global.WeaponList.Shotgun);
selected_weapon = 0;
weapon = global.PlayerWeapon[selected_weapon];

