extends Control

func _ready():
	for i in Globals.highestLevel+1:
		get_child(i).visible = true
		get_child(i).text = str(i+1)
		get_child(i).levelNumber = i
		get_child(i).levelPath = Globals.levelList[i]
