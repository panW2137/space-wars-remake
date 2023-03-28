extends CharacterBody2D
class_name Bullet

@export var speed = 0
@export var recoil:float = 0
var target = Vector2.ZERO
var direction = Vector2.ZERO

func _ready():
	look_at(target)
	direction = global_position.direction_to(target)
	direction = direction.rotated(deg_to_rad(randf_range(-recoil,recoil)))

func _physics_process(_delta):
	velocity = direction*speed
	move_and_slide()

func _on_hurtbox_area_entered(_area):
	queue_free()
