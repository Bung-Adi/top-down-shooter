// draw weapon behind the player
if aim_dir >= 0 && aim_dir < 180 {
	draw_my_weapon();
}

// draw player
draw_self();

// draw weapon
if aim_dir >= 180 && aim_dir < 360 {
	draw_my_weapon();
}





