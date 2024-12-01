class_name DeathInteractable
extends Interactable

@export
var _fire: AnimatedSprite2D

func _ready() -> void:
	if _fire != null:
		_fire.play("default")

func run_interaction() -> void:
	GameState.get_instance().johnathon()
