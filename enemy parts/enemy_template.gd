extends CharacterBody2D
class_name Enemy

signal enemy_dead
signal enemy_hurt(HP:int)

enum thingsToLookAt {
	PLAYER,
	MOUSE,
	TARGET,
	NONE
}
@onready var sprite = $sprite
@onready var hitSound = $hitsound
@onready var shootSound = $shootsound

@export var bulletPath:PackedScene = preload("res://enemy parts/bullet_template.tscn")
@export var deathEffectPath:PackedScene = preload("res://death effects/death_effect.tscn")

@export var health:int = 1
@export var speed:int = 100
@export var acceleration:float = 10
@export var disabled = false

var lookAtTarget:thingsToLookAt = thingsToLookAt.TARGET
var direction:Vector2 = Vector2.ZERO
var target:Vector2 = Vector2.ZERO
var isMoving:bool = false

func aiLoop():
	pass

func enable():
	randomize()
	aiLoop()
	set_random_target()

func _ready():
	if !disabled:
		randomize()
		aiLoop()
		set_random_target()


var e = true
func _process(_delta):
	if Globals.playerHealth <= 0 and e:
		e = false
		await get_tree().create_timer(1).timeout
		queue_free()

func _physics_process(_delta):
	#movement
	if isMoving:
		direction = global_position.direction_to(target)
		velocity = velocity.move_toward(direction * speed, acceleration)
		move_and_slide()
		if(global_position.distance_to(target) < 10):
			set_random_target()
	
	#rotation
	match lookAtTarget:
		thingsToLookAt.PLAYER:
			look_at(Globals.playerPos)
		thingsToLookAt.MOUSE:
			look_at(get_global_mouse_position())
		thingsToLookAt.TARGET:
			look_at(target)
		thingsToLookAt.NONE:
			pass

#functions for ai loop ---------------------------------------------------------

func set_random_target():
	target = Vector2(randi_range(50,750),randi_range(50,430))

func move(time:int):
	set_random_target()
	isMoving = true
	await get_tree().create_timer(time).timeout
	isMoving = false
	return 0

func randomTeleport():
	global_position = Vector2(randi_range(50,750),randi_range(50,430))

func shoot_at(tar:Vector2):
	var bullet = bulletPath.instantiate()
	bullet.global_position = global_position
	bullet.target = tar
	get_parent().add_child.call_deferred(bullet)

func damage():
	hitSound.play()
	health -= 1
	emit_signal("enemy_hurt",health)
	
	if health <= 0:
		death()

func death():
	var deathEffect = deathEffectPath.instantiate()
	deathEffect.global_position = global_position
	get_parent().add_child(deathEffect)
	emit_signal("enemy_dead")
	queue_free()

func wait(t:float):
	await get_tree().create_timer(t).timeout
	return 0

func _on_hitbox_area_entered(_area):
	damage()
