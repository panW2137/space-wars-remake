extends Enemy
@onready var laser = $Line2D
func _process(_delta):
	laser.look_at(get_global_mouse_position())

func aiLoop():
	while true:
		isMoving = true
		
		await wait(5)
		for i in 10:
			shootSound.play()
			shoot_at(get_global_mouse_position())
			await wait(0.1)
		await wait(1)
		for i in 10:
			shootSound.play()
			shoot_at(get_global_mouse_position())
			await wait(0.1)
