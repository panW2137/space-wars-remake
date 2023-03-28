extends Control

@onready var clickSound = $click
@onready var hoverSound = $hover

func _on_main_menu_pressed():
	clickSound.play()
	SceneChanger.changeScene("res://ui/main_menu.tscn")

func _on_restart_pressed():
	clickSound.play()
	SceneChanger.changeScene(Globals.levelList[Globals.currentLevel])

func _on_next_lvl_pressed():
	clickSound.play()
	SceneChanger.changeScene(Globals.levelList[Globals.currentLevel])

func _hover():
	hoverSound.play()
