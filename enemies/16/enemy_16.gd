extends Enemy

func aiLoop():
	lookAtTarget = thingsToLookAt.PLAYER
	while true:
		await wait(2)
		shootSound.play()
		shoot_at(Globals.playerPos)
		randomTeleport()
