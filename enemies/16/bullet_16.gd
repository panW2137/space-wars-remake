extends CharacterBody2D

var positions

@onready var bulPath = preload("res://enemies/16/bullet_16_mini.tscn")

@export var speed = 0
@export var recoil:float = 0
var target = Vector2.ZERO
var direction = Vector2.ZERO

func _ready():
	global_position = target
	for i in get_node("bullet positions").get_children():
		var bul = bulPath.instantiate()
		bul.global_position = i.global_position
		get_parent().add_child(bul)
	await get_tree().create_timer(1).timeout
	queue_free()

func _on_hurtbox_area_entered(_area):
	queue_free()
