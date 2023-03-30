extends Enemy

func aiLoop():
	while true:
		await move(5)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(1)
		sprite.frame = 1
		for i in 5:
			shootSound.play()
			for j in 50:
				shoot_at(Globals.playerPos)
			await wait(0.2)
		sprite.frame = 0
		await wait(1)
		lookAtTarget = thingsToLookAt.TARGET
