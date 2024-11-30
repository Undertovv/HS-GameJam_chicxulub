extends Node2D

@export var speed = 40
var direction = Vector2(0, 1)
var secureDirection = Vector2(0, 1)
var wayPoint = Vector2(0, 0)
@export var fucking = 16 #Distance between waypoints
var distanceTraveled = 0 ##Used for tracking trail sprite laying
const vertShaft = preload("res://sprites/Dino/VerticalMovementNeck.png")
const horiShaft = preload("res://sprites/Dino/DinoNeckHorizontal.png")
func _ready() -> void:
	wayPoint = Vector2(self.position.x, self.position.y + fucking)

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
	
	
	if self.position.distance_to(wayPoint) < 5:
		
		self.position = wayPoint
		distanceTraveled+=1

		
		if direction == Vector2(0, -1):
			wayPoint = self.position + Vector2(0, -fucking)
		if direction == Vector2(-1, 0):
			wayPoint = self.position + Vector2(-fucking, 0)
		if direction == Vector2(0, 1):
			wayPoint = self.position + Vector2(0, fucking)
		if direction == Vector2(1, 0):
			wayPoint = self.position + Vector2(fucking, 0)
	
		secureDirection = direction
	
	shmoeve(secureDirection, delta) #move and/or shmove

	

func shmoeve(dir: Vector2, delta: float):
	translate(dir * speed * delta)
	
func trail(direction): #change trail sprite for direction
	var sprite = Sprite2D.new()
	sprite.texture = direction
	sprite.scale = Vector2(0.2, 0.2)
	sprite.position = self.position
	self.get_parent().add_child(sprite)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Interactable:
		area.run_interaction()
