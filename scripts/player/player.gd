extends Node2D

@export
var speed = 2.0
var direction = Vector2(0, 0)

	#Get his ass movin AND schmoovin.
func _process(delta: float) -> void:
	direction = Input.get_vector("pivotLeft","pivotRight","pivotUp","pivotDown")
	schmoove(direction)

func schmoove(direction):
	#translate movement collected from proc to translate functions
	#translate functions will be called when ready
	translate(direction * speed);
