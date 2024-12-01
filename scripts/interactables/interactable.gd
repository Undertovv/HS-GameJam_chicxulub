class_name Interactable
extends Area2D

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

## Called by the player object when an interaction needs to be run
func run_interaction() -> void:
	pass
