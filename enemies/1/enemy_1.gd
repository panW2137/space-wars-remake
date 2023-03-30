extends Enemy

func aiLoop():
	while true:
		await move(5)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.5)
		for i in 10:
			shoot_at(Globals.playerPos)
			sprite.frame = 1
			await wait(0.1)
			sprite.frame = 0
			await wait(0.2)
		lookAtTarget = thingsToLookAt.TARGET
		await wait(1)
