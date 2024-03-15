get_damage_create(20,true);

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
sprite[0] = spr_player_right;
sprite[1] = spr_player_up;
sprite[2] = spr_player_left;
sprite[3] = spr_player_down;

// Weapon info
shoot_timer = 0;
array_push(global.PlayerWeapon, global.WeaponList.AR, global.WeaponList.Shotgun);
selected_weapon = 0;
weapon = global.PlayerWeapon[selected_weapon];

