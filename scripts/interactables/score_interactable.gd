class_name ScoreInteractable
extends Interactable

@export
var score: int

func run_interaction() -> void:
	GameState.get_instance().add_score(score)
	queue_free()
