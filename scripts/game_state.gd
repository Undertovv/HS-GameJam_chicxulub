class_name GameState
extends Node

@export
var scoreText : RichTextLabel

@export
var _segment: Segment

@export
var _player: Player

@export
var trailHolder : Node2D

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
	#get_tree().quit()
	player_died.emit()
#endregion

#region Segment Resetting
func reset_segment() -> void:
	_segment.set_death_barrier_enabled(false)
	get_tree().call_group("neck", "queue_free")
	_segment.randomise_layout()
	
	_player.position = Vector2(_player.position.x, 1408)
	_player.direction = Vector2.UP
	_player.wayPoint = _player.position + (Vector2.UP * 256)
	_player.waypoint_reached.connect(_enable_the_death_barrier)
	
	for child in trailHolder.get_children():
		child.queue_free()
	
func _enable_the_death_barrier() -> void:
	_segment.set_death_barrier_enabled(true)
	_player.waypoint_reached.disconnect(_enable_the_death_barrier)
#endregion
