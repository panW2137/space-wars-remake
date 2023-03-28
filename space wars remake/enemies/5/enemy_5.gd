extends Enemy

func aiLoop():
	while true:
		lookAtTarget = thingsToLookAt.PLAYER
		
		randomTeleport()
		await wait(1)
		for i in 10:
			shootSound.play()
			shoot_at(Globals.playerPos)
			await wait(0.2)
			shootSound.play()
			shoot_at(get_global_mouse_position())
			await wait(0.2)
		await wait(1)
