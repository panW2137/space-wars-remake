extends Enemy

@onready var borderDetector = $"border detector"

var isRaming:bool = false
var ramingTarget:Vector2 = Vector2.ZERO
var startingSpeed:int = 0
var startingAccel:int = 0

func ramShoot():
	for i in 200:
		shoot_at(Globals.playerPos)

func aiLoop():
	startingSpeed = speed
	startingAccel = acceleration
	while true:
		lookAtTarget = thingsToLookAt.TARGET
		await move(1)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(1)
		
		#choose target to ram
		ramingTarget = global_position.direction_to(Globals.playerPos)
		ramingTarget *= 1000000
		
		#activate raming
		shootSound.play()
		speed = 1000
		acceleration = 1000
		target = ramingTarget
		lookAtTarget = thingsToLookAt.TARGET
		isRaming = true
		isMoving = true
		ramShoot()
		await borderDetector.area_entered
		isRaming = false
		isMoving = false
		
		#after raming
		velocity = Vector2.ZERO
		speed = startingSpeed
		acceleration = startingAccel
		lookAtTarget = thingsToLookAt.PLAYER
		set_random_target()
		await wait(1)

