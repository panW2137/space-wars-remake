extends CharacterBody2D

var direction:Vector2 = Vector2.ZERO
var speed = 600

func _ready():
	modulate = Globals.playerColor
	look_at(get_global_mouse_position())
	direction = global_position.direction_to(get_global_mouse_position())

func _process(_delta):
	velocity = direction*speed
	move_and_slide()


func _on_hitbox_area_entered(_area):
	queue_free()
