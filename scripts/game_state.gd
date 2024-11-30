class_name GameState
extends Node

#region Singleton
static var _instance: GameState

static func get_instance() -> GameState:
	return _instance

func _enter_tree() -> void:
	_instance = self
	
func _exit_tree() -> void:
	_instance = null
#endregion

#region Score
signal score_changed(current_score: int)
var _current_score: int = 0

func add_score(score: int) -> void:
	_current_score += score
	score_changed.emit(_current_score)
#endregion
