extends Control


func _on_quit_to_title_pressed() -> void:
	get_tree().reload_current_scene()
