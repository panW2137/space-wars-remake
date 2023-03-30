extends Control

@onready var anim = $AnimationPlayer

func _ready():
	anim.play("splash")


func _on_animation_player_animation_finished(_anim_name):
	SceneChanger.changeScene("res://ui/main_menu.tscn")
