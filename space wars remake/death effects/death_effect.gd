extends Node2D

func _ready():
	get_node("GPUParticles2D").emitting = true
	get_node("GPUParticles2D2").emitting = true
	get_node("GPUParticles2D3").emitting = true

func _on_sound_finished():
	queue_free()
