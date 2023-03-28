extends Enemy

func aiLoop():
	lookAtTarget = thingsToLookAt.PLAYER
	isMoving = true
	while true:
		for i in 5:
			shootSound.play()
			for j in 40:
				shoot_at(Vector2(randf_range(0,800),randf_range(0,480)))
			await wait(1)
		await wait(1)
