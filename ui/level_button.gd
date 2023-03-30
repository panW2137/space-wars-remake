extends Button

@onready var clickSound = $click
@onready var hoverSound = $hover

var levelPath:String = ""
var levelNumber:int = 0

func _on_pressed():
	Globals.currentLevel = levelNumber
	SceneChanger.changeScene(levelPath)


func _on_mouse_entered():
	hoverSound.play()

func sound():
	clickSound.play()
