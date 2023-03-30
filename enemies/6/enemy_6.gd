extends Enemy

func aiLoop():
	lookAtTarget = thingsToLookAt.PLAYER
	while true:
		sprite.frame = 0
		shootSound.play()
		shoot_at(Globals.playerPos)
		await wait(0.05)
		shootSound.play()
		shoot_at(Globals.playerPos)
		await wait(0.05)
		
		sprite.frame = 1
		shootSound.play()
		shoot_at(Globals.playerPos)
		await wait(0.05)
		shootSound.play()
		shoot_at(Globals.playerPos)
		await wait(0.05)
