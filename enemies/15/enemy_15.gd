extends Enemy

@onready var minionPath:PackedScene = preload("res://enemies/15/enemy_15_mini.tscn")

func aiLoop():
	while true:
		await move(5)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.5)
		for i in 3:
			shootSound.play()
			sprite.frame = 1
			for j in 3:
				shoot_at(Globals.playerPos)
			await wait(0.2)
			sprite.frame = 0
			await wait(0.3)
		await wait(0.5)
		lookAtTarget = thingsToLookAt.TARGET

func _on_timer_timeout():
	var minion = minionPath.instantiate()
	minion.global_position = global_position
	get_parent().add_child(minion)
