extends Control

var esc:bool = true

func _process(_delta):
	if Input.is_action_just_pressed("escape") and esc:
		esc = false
		SceneChanger.changeScene("res://ui/main_menu.tscn")
