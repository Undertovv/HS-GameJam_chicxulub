class_name ScoreInteractable
extends Interactable

@export
var score: int

@export
var _animation_player: AnimationPlayer

func run_interaction() -> void:
	monitorable = false
	GameState.get_instance().add_score(score)
	
	_animation_player.play("explode")
	await _animation_player.animation_finished
	
	queue_free()
