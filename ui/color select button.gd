extends Button

@export var color:Color

signal changeColor(col:Color)

func _ready():
	get_node("ColorRect").modulate = color

func _on_pressed():
	emit_signal("changeColor",color)
