extends Enemy

@onready var laserColl = $hurtbox/CollisionShape2D
@onready var laserEf1 = $"laser 1"
@onready var laserEf2 = $"laser 2"

var aimFor:Vector2 = Vector2.ZERO

func laserOn():
	laserColl.disabled = false
	laserEf1.visible = true
	laserEf2.visible = true

func laserOff():
	laserColl.disabled = true
	laserEf1.visible = false
	laserEf2.visible = false

func aiLoop():
	laserOff()
	while true:
		await move(3)
		if randi_range(0,1) == 1:
			aimFor = Globals.playerPos
		else:
			aimFor = get_global_mouse_position()
		lookAtTarget = thingsToLookAt.NONE
		look_at(aimFor)
		await wait(0.2)
		sprite.frame = 1
		laserOn()
		shootSound.play()
		await wait(1)
		sprite.frame = 0
		laserOff()
		lookAtTarget = thingsToLookAt.TARGET
		await wait(0.5)
