extends Enemy

@onready var ambient = $ambient

func enable():
	randomize()
	aiLoop()
	set_random_target()
	ambient.play()

func aiLoop():
	isMoving = true
	while true:
		for i in 50:
			for j in 5:
				shoot_at(Globals.playerPos)
			await  wait(0.1)
		await wait(0.5)
		for j in 5:
			shootSound.play()
			for i in 50:
				shoot_at(Globals.playerPos)
			await  wait(0.5)

var anim:bool = true

func _on_timer_timeout():
	if anim:
		sprite.frame = 0
	else:
		sprite.frame = 1
	anim = !anim


func _on_ambient_finished():
	ambient.play()
