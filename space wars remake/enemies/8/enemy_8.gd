extends Enemy

@onready var ss2 = $"shootsound 2"

func aiLoop():
	isMoving = true
	while true:
		await wait(5)
		for i in 20:
			shootSound.play()
			shoot_at(Globals.playerPos)
			await wait(0.2)
		await wait(1)
		for i in 20:
			shootSound.play()
			shoot_at(Globals.playerPos)
			await wait(0.2)
		await wait(3)
		for j in 3:
			ss2.play()
			for i in 50:
				shoot_at(Vector2(randf_range(0,800),randf_range(0,480)))
			await wait(0.5)
