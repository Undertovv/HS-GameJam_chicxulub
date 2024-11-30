extends Node2D

@export var speed = 2.0
var direction = Vector2(0, 0)

	#Get his ass movin AND schmoovin.
func _process(delta: float) -> void:
	var input: Vector2 = Input.get_vector("pivotLeft","pivotRight","pivotUp","pivotDown").normalized()
	if direction != input and input != Vector2(0,0):
		direction = input
		
	#For testing, remove later
	schmoove(direction)

func schmoove(direction):
	#main movement function, translates movement collected from proc
	translate(direction * speed);
