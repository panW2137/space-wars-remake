extends Enemy

func aiLoop():
	isMoving = true
	while true:
		await wait(2)
		shootSound.play()
		shoot_at(Globals.playerPos)
