extends Control


func _on_play_pressed() -> void:
	GameState.get_instance().start_game()


func _on_quit_pressed() -> void:
	get_tree().quit()
