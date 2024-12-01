extends Control


func _on_quit_to_title_pressed() -> void:
	GameState.get_instance().quit_to_title()
