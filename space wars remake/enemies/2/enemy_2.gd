extends Enemy

func aiLoop():
	while true:
		await move(5)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.5)
		sprite.frame = 1
		for i in 5:
			shootSound.play()
			shoot_at(Globals.playerPos)
			await wait(0.2)
		sprite.frame = 0
		lookAtTarget = thingsToLookAt.TARGET
		await wait(0.5)
