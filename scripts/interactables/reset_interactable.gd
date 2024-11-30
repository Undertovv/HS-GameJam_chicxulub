class_name ResetInteractable
extends Interactable

func run_interaction() -> void:
	GameState.get_instance().reset_segment()
