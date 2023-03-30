extends Enemy

func aiLoop():
	while true:
		move(5)
		for i in 50:
			shootSound.play()
			shoot_at(Globals.playerPos)
			await wait(0.1)
		await wait(1)

