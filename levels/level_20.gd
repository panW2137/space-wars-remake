extends "res://world/world.gd"

#@onready var player = $player
#@onready var ui = $"world ui"
#@onready var gameOver = $"game over screen"
#@onready var gameWon = $"game won screen"
#@onready var background = $Background

#var playerAlive:bool = true
@onready var bossStartingPos = $"boss starting pos"

@onready var bossPhase1 = $"enemy 20 p 1"
@onready var bossPhase2 = $"enemy 20 p 2"
@onready var bossPhase3 = $"enemy 20 p 3"

var phase = 1

func _ready():
	match phase:
		1:
			bossPhase1.global_position = bossStartingPos.global_position
			bossPhase1.process_mode = Node.PROCESS_MODE_INHERIT
			bossPhase1.enable()
		2:
			bossPhase2.global_position = bossStartingPos.global_position
			bossPhase2.process_mode = Node.PROCESS_MODE_INHERIT
			bossPhase2.enable()
		3:
			bossPhase3.global_position = bossStartingPos.global_position
			bossPhase3.process_mode = Node.PROCESS_MODE_INHERIT
			bossPhase3.enable()
			

func _on_enemy_20_p_1_enemy_dead():
	bossPhase2.global_position = bossPhase1.global_position
	bossPhase2.process_mode = Node.PROCESS_MODE_INHERIT
	bossPhase2.enable()
	ui.firstTimeEnemyHurt = true
	get_node("world ui/enemy HP full").size.x = 120

func _on_enemy_20_p_1_enemy_hurt(HP):
	ui.updateEnemyHP(HP)

func _on_enemy_20_p_2_enemy_dead():
	bossPhase3.global_position = bossPhase2.global_position
	bossPhase3.process_mode = Node.PROCESS_MODE_INHERIT
	bossPhase3.enable()
	ui.firstTimeEnemyHurt = true
	get_node("world ui/enemy HP full").size.x = 120

func _on_enemy_20_p_2_enemy_hurt(HP):
	ui.updateEnemyHP(HP)

func _on_enemy_20_p_3_enemy_dead():
	await get_tree().create_timer(1).timeout
	SceneChanger.changeScene("res://ui/victory_screen.tscn")

func _on_enemy_20_p_3_enemy_hurt(HP):
	ui.updateEnemyHP(HP)
