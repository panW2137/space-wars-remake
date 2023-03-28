extends Enemy

@export var bullet2Path:PackedScene = preload("res://enemies/20/bullet_20_2.tscn")

@onready var aimer = $cannon/aimer
@onready var rs = $rocketsound

func aiLoop():
	while true:
		await move(3)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.5)
		sprite.frame = 1
		for i in 10:
			shootSound.play()
			rotateCannon()
			for j in 20:
				bullet_at(aimer.global_position)
			await wait(0.1)
		sprite.frame = 0
		await wait(1)
		lookAtTarget = thingsToLookAt.TARGET
		rs.play()
		for i in 50:
			rocket_at(Vector2(randi_range(50,750),randi_range(50,430)))

func bullet_at(tar:Vector2):
	var bullet = bullet2Path.instantiate()
	bullet.global_position = global_position
	bullet.target = tar
	get_parent().add_child.call_deferred(bullet)
	
func rocket_at(tar:Vector2):
	var bullet = bulletPath.instantiate()
	bullet.global_position = global_position
	bullet.target = tar
	get_parent().add_child.call_deferred(bullet)

func rotateCannon():
	get_node("cannon").look_at(Globals.playerPos)
	get_node("cannon").rotation_degrees += randf_range(-20,20)
