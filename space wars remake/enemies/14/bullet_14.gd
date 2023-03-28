extends Bullet

var repulseDepth = 0

func _on_hurtbox_2_area_entered(_area):
	match repulseDepth:
		0:
			target = Globals.playerPos
			look_at(target)
			direction = global_position.direction_to(target)
			direction = direction.rotated(deg_to_rad(randf_range(-recoil,recoil)))
		1:
			target = get_global_mouse_position()
			look_at(target)
			direction = global_position.direction_to(target)
			direction = direction.rotated(deg_to_rad(randf_range(-recoil,recoil)))
		2:
			queue_free()
	repulseDepth += 1
