extends Node

var playerPos:Vector2 = Vector2.ZERO
var playerColor:Color = Color(0, 0.2863, 0.7961, 1)
var playerRegen = 2
var playerHealth = 100

var currentLevel:int = 0
var highestLevel:int = 0
var difficulty = diffLevs.NORMAL
var laserScope:bool = false

var menuOnLvSelect:bool = false

var levelList:Array[String] = [
	"res://levels/level_1.tscn",
	"res://levels/level_2.tscn",
	"res://levels/level_3.tscn",
	"res://levels/level_4.tscn",
	"res://levels/level_5.tscn",
	"res://levels/level_6.tscn",
	"res://levels/level_7.tscn",
	"res://levels/level_8.tscn",
	"res://levels/level_9.tscn",
	"res://levels/level_10.tscn",
	"res://levels/level_11.tscn",
	"res://levels/level_12.tscn",
	"res://levels/level_13.tscn",
	"res://levels/level_14.tscn",
	"res://levels/level_15.tscn",
	"res://levels/level_16.tscn",
	"res://levels/level_17.tscn",
	"res://levels/level_18.tscn",
	"res://levels/level_19.tscn",
	"res://levels/level_20.tscn"
]

enum diffLevs {
	EASY,
	NORMAL,
	HARD
}

func _ready():
	randomize()
	load_save()

#please work first time i beg you

func save():
	var config = ConfigFile.new()
	# Store some values.
	config.set_value("save", "highscore", highestLevel)
	config.set_value("save", "color", playerColor)
	config.set_value("save", "difficulty", difficulty)
	config.set_value("save", "scope", laserScope)

	config.save("user://save.cfg")

func load_save():
	var config = ConfigFile.new()
	var err = config.load("user://save.cfg")

	if err != OK:
		return

	for dat in config.get_sections():
		highestLevel = config.get_value(dat, "highscore")
		playerColor = config.get_value(dat, "color")
		difficulty = config.get_value(dat, "difficulty")
		laserScope = config.get_value(dat, "scope")

#thank you
