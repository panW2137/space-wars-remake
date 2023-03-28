extends Control

@onready var hpbar = $"HP full"
@onready var enemyHpbar = $"enemy HP full"

var firstTimeEnemyHurt:bool = true
var MaxEnemyHP:int = 1

var enemyMaxHP:int

func _ready():
	hpbar.modulate = Globals.playerColor

func updatePlayerHP(health:int):
	hpbar.size.x = 1.2 * health

func updateEnemyHP(health:int):
	if firstTimeEnemyHurt:
		firstTimeEnemyHurt = false
		enemyMaxHP = health + 1
	enemyHpbar.size.x = 1.2 * float(health)/enemyMaxHP*100

