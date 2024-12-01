class_name Player
extends Node2D

@export var speed = 200
##Direction (Changes on key press)
var direction = Vector2(0, -1)
##Direction the player moves (Based on last key press - Set with direction variable)
var wayPoint = Vector2(0, 0) 
@export var fuckingx = 120 ##Distance between waypoints - X
@export var fuckingy = 256 ##Distance between waypoints - Y
const verticle = preload("res://scenes/touchFluffyTail.tscn")
const horizontal = preload("res://scenes/sidewaysPickle.tscn")
const corner = preload("res://scenes/cornerNeck.tscn")
var trailHolder : Node2D 
var nextDirection = Vector2(0, -1)

signal waypoint_reached

func _ready() -> void:
	trailHolder = self.get_parent().find_child("TrailHolder")
	wayPoint = Vector2(self.position.x, self.position.y - fuckingy)

# Get his ass movin AND schmoovin.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pivotUp"):
		nextDirection = Vector2(0, -1)
	if Input.is_action_just_pressed("pivotLeft"):
		nextDirection = Vector2(-1, 0)
	if Input.is_action_just_pressed("pivotDown"):
		nextDirection = Vector2(0, 1)
	if Input.is_action_just_pressed("pivotRight"):
		nextDirection = Vector2(1, 0)
	
	
	if self.position.distance_to(wayPoint) < 5:
		waypoint_reached.emit()
		self.position = wayPoint
		
		if direction == -nextDirection:
			nextDirection = direction
		
		if nextDirection == Vector2(0, -1): #Up
			if  direction == nextDirection:
				trailVert("up")
			elif direction == Vector2.UP and nextDirection == Vector2.RIGHT:
				trailCorner(270)
			wayPoint = self.position + Vector2(0, -fuckingy)
			$Sprite2D.set_rotation_degrees(0)
			
		if nextDirection == Vector2(-1, 0): #Left
			if  direction == nextDirection:
				trailHori("right")
			elif direction == Vector2.UP and nextDirection == Vector2.LEFT:
				trailCorner(90)
			wayPoint = self.position + Vector2(-fuckingx, 0)
			$Sprite2D.set_rotation_degrees(270)
		if nextDirection == Vector2(0, 1): #Down
			wayPoint = self.position + Vector2(0, fuckingy)
			trailVert("down")
			$Sprite2D.set_rotation_degrees(180)
		if nextDirection == Vector2(1, 0): #Right
			if  direction == nextDirection:
				trailHori("left")
			elif direction == Vector2.UP and nextDirection == Vector2.RIGHT:
				trailCorner(0)
			wayPoint = self.position + Vector2(fuckingx, 0)
			$Sprite2D.set_rotation_degrees(90)
			
		direction = nextDirection
		
	shmoeve(direction, delta) #move and/or shmove
	

func shmoeve(dir: Vector2, delta: float):
	translate(dir * speed * delta)

func trailCorner(rot):
	pass
	#var cornerTail = corner.instantiate()
	#cornerTail.set_rotation_degrees(rot)
	#cornerTail.position = Vector2(self.position)
	#trailHolder.add_child(cornerTail)

func trailHori(dir):
	var horiTail = horizontal.instantiate()
	if dir == "right":
		horiTail.position = Vector2(self.position[0] + 100, self.position[1])
	else:
		horiTail.position = Vector2(self.position[0] - 100, self.position[1])

	trailHolder.add_child(horiTail)

func trailVert(dir): #change trail sprite for direction
	var vertTail = verticle.instantiate()
	vertTail.scale = Vector2(0.75, 1)
	vertTail.z_index = 1
	if dir == "up":
		vertTail.position = Vector2(self.position[0], self.position[1] + 150)
	else:
		vertTail.position = Vector2(self.position[0], self.position[1] - 150)
	trailHolder.add_child(vertTail)


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Interactable:
		area.run_interaction()
