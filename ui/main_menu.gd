extends Control

@onready var playerColrRepr = $"Panel/player color"
@onready var levelSelectButtons = $"Panel/colors/debug level"
@onready var animation = $AnimationPlayer
@onready var menu = $Panel
@onready var colorBar = $Panel/colors
@onready var difButton = $"Panel/difficulty button"
@onready var debugLevel = $"Panel/colors/debug level"
@onready var scopeButton = $"Panel/scope button"

@onready var hoverSound = $hover
@onready var clickSound = $click

var colorsShown:bool = false

func _ready():
	playerColrRepr.modulate = Globals.playerColor
	
	if Globals.menuOnLvSelect:
		menu.position.x = 0
	else:
		menu.position.x = 800
		
	difButtonText()
	scopeButtonColor()
	
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

func _on_toggle_color_button_pressed():
	scopeButton.visible = colorsShown
	difButton.visible = colorsShown
	
	colorsShown = !colorsShown
	colorBar.visible = colorsShown

func _on_difficulty_button_pressed():
	match Globals.difficulty:
		Globals.diffLevs.EASY:
			Globals.difficulty = Globals.diffLevs.NORMAL
		Globals.diffLevs.NORMAL:
			Globals.difficulty = Globals.diffLevs.HARD
		Globals.diffLevs.HARD:
			Globals.difficulty = Globals.diffLevs.EASY
	difButtonText()

func difButtonText():
	match Globals.difficulty:
		Globals.diffLevs.EASY:
			difButton.text = "easy"
		Globals.diffLevs.NORMAL:
			difButton.text = "normal"
		Globals.diffLevs.HARD:
			difButton.text = "hard"

func _on_scope_button_pressed():
	Globals.laserScope = !Globals.laserScope
	scopeButtonColor()

func scopeButtonColor():
	if Globals.laserScope:
		get_node("Panel/scope button/LaserScope").modulate = Color(1,1,1,1)
	else:
		get_node("Panel/scope button/LaserScope").modulate = Color(0.2,0.2,0.2,1)
