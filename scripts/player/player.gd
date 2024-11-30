extends CharacterBody2D


const SPEED = 20.0

func _physics_process(delta: float) -> void:
	
	# Gravity is set to 0 because it's space-themed :3
	# (don't) add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

# Get his ass movin AND schmoovin.
	var yDirection := Input.get_axis("pivotUp", "pivotDown")
	if yDirection:
		velocity.y = yDirection * SPEED
	else:
		velocity.y = yDirection * SPEED

	var xDirection := Input.get_axis("pivotLeft", "pivotRight")
	if xDirection:
		velocity.x = xDirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
