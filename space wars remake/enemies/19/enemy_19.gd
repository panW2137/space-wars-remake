extends Enemy

func aiLoop():
	isMoving = true
	while true:
		await wait(3)
		
		for i in 5:
			shootSound.play()
			for j in 3:
				shoot_at(get_global_mouse_position())
				shoot_at(Globals.playerPos)
			await wait(0.2)
			
