extends Node2D

@export
var speed = 100
var direction = Vector2(0, -1)

# Get his ass movin AND schmoovin.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_W):
		direction = Vector2(0, -1)
	if Input.is_key_pressed(KEY_A):
		direction = Vector2(-1, 0)
	if Input.is_key_pressed(KEY_S):
		direction = Vector2(0, 1)
	if Input.is_key_pressed(KEY_D):
		direction = Vector2(1, 0)
		
	shmoeve(direction, delta)
	

func shmoeve(dir: Vector2, delta: float):
	translate(dir * speed * delta)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Interactable:
		area.run_interaction()
