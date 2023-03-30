extends Enemy

func aiLoop():
	while true:
		await move(5)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.3)
		for i in 50:
			
			sprite.frame = 1
			shoot_at(Globals.playerPos)
			await wait(0.05)
			shoot_at(Globals.playerPos)
			await wait(0.05)
			
			sprite.frame = 2
			shoot_at(Globals.playerPos)
			await wait(0.05)
			shoot_at(Globals.playerPos)
			await wait(0.05)
		sprite.frame = 0
		lookAtTarget = thingsToLookAt.TARGET
		await wait(1)
