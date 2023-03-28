extends Enemy

func aiLoop():
	while true:
		await move(3)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.5)
		for i in 5:
			shootSound.play()
			for j in 20:
				shoot_at(Globals.playerPos)
			await wait(0.2)
		await wait(1)
		lookAtTarget = thingsToLookAt.TARGET
