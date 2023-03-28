extends Enemy

var tar1:Vector2 = Vector2.ZERO
var tar2:Vector2 = Vector2.ZERO
var tar3:Vector2 = Vector2.ZERO

@onready var las1 = $"laser 1"
@onready var las2 = $"laser 2"
@onready var las3 = $"laser 3"

func aiLoop():
	newTargets()
	isMoving = true
	while true:
		shoot_at(tar1)
		shoot_at(tar2)
		shoot_at(tar3)
		await wait(0.1)

func _process(_delta):
	las1.look_at(tar1)
	las2.look_at(tar2)
	las3.look_at(tar3)

func newTargets():
	tar1 = Globals.playerPos
	tar2 = get_global_mouse_position()
	tar3 = Vector2(randi_range(50,750),randi_range(50,430))


func _on_timer_timeout():
	newTargets()

func _on_shootsound_finished():
	shootSound.play()
