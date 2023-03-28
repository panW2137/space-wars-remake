extends Bullet

func _on_timer_timeout():
	
	target = Globals.playerPos
	
	look_at(target)
	direction = global_position.direction_to(target)
	direction = direction.rotated(deg_to_rad(randf_range(-recoil,recoil)))
