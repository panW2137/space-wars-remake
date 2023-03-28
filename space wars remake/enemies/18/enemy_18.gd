extends Enemy

@onready var shieldBar = $"ui/shield bar full"
@onready var shieldBreakSound = $"shield break sound"
@onready var shieldHitSound = $hitsoundshield

@export var shield = 5
var shieldExist:bool = true
var playerDead:bool = false

func aiLoop():
	while true:
		await move(3)
		lookAtTarget = thingsToLookAt.PLAYER
		await wait(0.5)
		sprite.frame = 0
		for i in 5:
			shootSound.play()
			for j in 30:
				shoot_at(Globals.playerPos)
			await wait(0.1)
		sprite.frame = 1
		await wait(1)
		lookAtTarget = thingsToLookAt.TARGET

func _process(_delta):
	shieldBar.size.x = 1.2 * float(shield)/5*100
	if Globals.playerHealth <= 0 and !playerDead:
		playerDead = true
		await wait(1)
		get_node("ui").visible = false

func damage():
	if shieldExist:
		shield -= 1
		shieldHitSound.play()
		if shield <= 0:
			shieldExist = false
			get_node("shield").visible = false
			shieldBreakSound.play()
	else:
		hitSound.play()
		health -= 1
		emit_signal("enemy_hurt",health)
		
		if health <= 0:
			death()

func _on_timer_timeout():
	if shieldExist and shield < 5:
		shield += 1
