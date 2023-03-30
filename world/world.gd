extends Node2D

@onready var player = $player
@onready var ui = $"world ui"
@onready var gameOver = $"game over screen"
@onready var gameWon = $"game won screen"
@onready var background = $Background

var playerAlive:bool = true

func _physics_process(_delta):
	if playerAlive:
		ui.updatePlayerHP(player.health)

func _on_player_player_dead():
	playerAlive = false
	await get_tree().create_timer(1).timeout
	process_mode=Node.PROCESS_MODE_DISABLED
	ui.visible = false
	gameOver.visible = true
	background.z_index = 1

func _on_enemy_enemy_dead():
	if Globals.currentLevel + 1 < Globals.levelList.size():
		Globals.currentLevel += 1
		if Globals.highestLevel < Globals.currentLevel:
			Globals.highestLevel = Globals.currentLevel
	await get_tree().create_timer(1).timeout
	if playerAlive:
		playerAlive = false
		player.queue_free()
		ui.visible = false
		gameWon.visible = true
		background.z_index = 1

func _on_enemy_enemy_hurt(HP):
	ui.updateEnemyHP(HP)
