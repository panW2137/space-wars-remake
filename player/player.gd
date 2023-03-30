extends CharacterBody2D

signal player_damaged
signal player_dead

@onready var colorParts = $PlayerColor
@onready var particles = $GPUParticles2D
@onready var hitSound = $"hit sound"
@onready var shootSound = $"shoot sound"

@onready var bulletPath:PackedScene = preload("res://player/player_bullet.tscn")
@onready var deathEffectPath:PackedScene = preload("res://death effects/death_effect.tscn")

var health:int = 100
var direction:Vector2 = Vector2.ZERO
var speed:float = 250
var acceleration:float = 20
var canShoot:bool = true

func _ready():
	Globals.playerHealth = health
	colorParts.modulate = Globals.playerColor
	particles.modulate = Globals.playerColor

func _physics_process(_delta):
	#constantly update player position in global variable cuz im lazy
	Globals.playerPos = global_position
	
	#look at player
	look_at(get_global_mouse_position())
	
	#handling movement
	direction = global_position.direction_to(get_global_mouse_position())
	if global_position.distance_to(get_global_mouse_position()) < 15:
		velocity = velocity.move_toward(Vector2.ZERO,acceleration)
	else:
		velocity = velocity.move_toward(direction * speed,acceleration)
	move_and_slide()
	
	#shootin'
	if Input.is_action_pressed("shoot") and canShoot:
		shootSound.play()
		shootingCooldown(1)
		var bullet:CharacterBody2D = bulletPath.instantiate()
		bullet.global_position = global_position
		get_parent().add_child(bullet)

func shootingCooldown(sec:int):
	canShoot = false
	await get_tree().create_timer(sec).timeout
	canShoot = true

func _on_hitbox_area_entered(area):
	hitSound.play()
	health -= area.damage
	Globals.playerHealth = health
	if health <= 0:
		health = 0
		emit_signal("player_dead")
		
		var deathEffect = deathEffectPath.instantiate()
		deathEffect.global_position = global_position
		get_parent().add_child(deathEffect)
		queue_free()
	
	emit_signal("player_damaged")


func _on_regeneration_timeout():
	if health < 100:
		health += Globals.playerRegen
	if health > 100:
		health = 100
