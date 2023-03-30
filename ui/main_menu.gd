extends Control

@onready var playerColrRepr = $"Panel/colors/player color"
@onready var levelSelectButtons = $"Panel/colors/debug level"
@onready var animation = $AnimationPlayer
@onready var menu = $Panel

@onready var hoverSound = $hover
@onready var clickSound = $click

func _ready():
	playerColrRepr.modulate = Globals.playerColor
	
	if Globals.menuOnLvSelect:
		menu.position.x = 0
	else:
		menu.position.x = 800
	
func _on_button_pressed():
	Globals.currentLevel = -1
	SceneChanger.changeScene("res://levels/debug_level.tscn")

func _on_change_color(col):
	Globals.playerColor = col
	playerColrRepr.modulate = col

func _on_start_button_pressed():
	Globals.menuOnLvSelect = true
	animation.play("change")

func _on_return_button_pressed():
	Globals.menuOnLvSelect = false
	animation.play_backwards("change")

func _on_button_mouse_entered():
	hoverSound.play()

func _on_exit_button_pressed():
	Globals.save()
	get_tree().quit()

func _button_click_sound():
	clickSound.play()

func _on_save_button_pressed():
	animation.play("save anim")
	Globals.save()
