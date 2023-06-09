extends CharacterBody2D

@export var speed = 0
@export var recoil:float = 0
var target = Globals.playerPos
var direction = Vector2.ZERO

var activated:bool = false

func _ready():
	look_at(target)
	direction = global_position.direction_to(target)
	direction = direction.rotated(deg_to_rad(randf_range(-recoil,recoil)))

func _physics_process(_delta):
	if activated:
		velocity = direction*speed
		move_and_slide()

func _on_hurtbox_area_entered(_area):
	queue_free()

func _on_timer_timeout():
	activated = true
