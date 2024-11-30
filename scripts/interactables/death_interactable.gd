class_name DeathInteractable
extends Interactable

@export
var _fire: AnimatedSprite2D

func _ready() -> void:
	_fire.play("default")

func run_interaction() -> void:
	GameState.get_instance().johnathon()
