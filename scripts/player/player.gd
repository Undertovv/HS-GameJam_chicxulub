class_name Player
extends Node2D

@export var speed = 200
##Direction (Changes on key press)
var direction = Vector2(0, -1)
##Direction the player moves (Based on last key press - Set with direction variable)
var secureDirection = Vector2(0, -1)
##Next point the player is able to move at
var wayPoint = Vector2(0, 0) 
@export var fuckingx = 120 ##Distance between waypoints - X
@export var fuckingy = 256 ##Distance between waypoints - Y
var distanceTraveled = 0 ##Used for tracking trail sprite laying
const verticle = preload("res://sprites/Dino/VerticalMovementNeck.png")
const horizontal = preload("res://sprites/Dino/DinoNeckHorizontal.png")

func _ready() -> void:
	wayPoint = Vector2(self.position.x, self.position.y - fuckingy)

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

		
		if direction == Vector2(0, -1): #Down
			wayPoint = self.position + Vector2(0, -fuckingy)
			trailUp()
			$Sprite2D.set_rotation_degrees(0)
		if direction == Vector2(-1, 0): #Left
			wayPoint = self.position + Vector2(-fuckingx, 0)
			trailRight()
			$Sprite2D.set_rotation_degrees(270)
		if direction == Vector2(0, 1): #Up
			wayPoint = self.position + Vector2(0, fuckingy)
			trailUp()
			$Sprite2D.set_rotation_degrees(180)
		if direction == Vector2(1, 0): #Right
			wayPoint = self.position + Vector2(fuckingx, 0)
			trailRight()
			$Sprite2D.set_rotation_degrees(90)
	
		secureDirection = direction
	
	shmoeve(secureDirection, delta) #move and/or shmove

	

func shmoeve(dir: Vector2, delta: float):
	translate(dir * speed * delta)

#TODO left and right trail

func trailRight():
	var sprite = Sprite2D.new()
	sprite.texture = horizontal
	sprite.position = Vector2(self.position[0] + 100, self.position[1])
	self.get_parent().add_child(sprite)

func trailUp(): #change trail sprite for direction
	var sprite = Sprite2D.new()
	sprite.texture = verticle
	sprite.scale = Vector2(0.75, 0.75)
	sprite.z_index = 1
	sprite.position = Vector2(self.position[0], self.position[1] + 100)
	self.get_parent().add_child(sprite)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Interactable:
		area.run_interaction()
