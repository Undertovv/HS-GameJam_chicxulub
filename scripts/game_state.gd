class_name GameState
extends Node

@export
var scoreText : RichTextLabel

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
	var scoreAmount = str(_current_score)
	scoreText.text = "Score: " + scoreAmount
	score_changed.emit(_current_score)
#endregion

#region Death
## Emmitted when the player has collided with a wall or itself
signal player_died

## Kills the player
func johnathon() -> void:
	player_died.emit()
#endregion
