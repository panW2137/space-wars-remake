extends Enemy

func aiLoop():
	while true:
		await move(5)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(1)
		for i in 10:
			shootSound.play()
			for j in 10:
				shoot_at(Globals.playerPos)
			await wait(0.1)
		await wait(1)
		lookAtTarget = thingsToLookAt.TARGET
