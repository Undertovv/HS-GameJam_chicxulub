extends Node2D

@export
var SPEED = 20.0

func _physics_process(delta: float) -> void:

# Get his ass movin AND schmoovin.
	var yDirection := Input.get_axis("pivotUp", "pivotDown")
	if yDirection:
		translate(Vector2(0, 0) * SPEED) # Go North
	else:
		translate(Vector2(0, 1) * SPEED) # Go South

	var xDirection := Input.get_axis("pivotLeft", "pivotRight")
	if xDirection:
		translate(Vector2(1, 0) * SPEED) # Go East
	else:
		translate(Vector2(1, 1) * SPEED) # Go West
