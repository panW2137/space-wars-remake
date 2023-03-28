extends Enemy

func aiLoop():
	isMoving = true
	while true:
		await wait(3)
		
		for i in 10:
			shootSound.play()
			shoot_at(Globals.playerPos)
			await wait(0.5)
