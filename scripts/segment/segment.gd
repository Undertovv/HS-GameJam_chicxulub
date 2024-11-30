class_name Segment
extends Node2D

const GRID_WIDTH: int = 6
const GRID_HEIGHT: int = 5

@onready
var _building_layout: TileMapLayer = $Building

func _ready() -> void:
	randomise_layout()

func randomise_layout() -> void:
	for x in GRID_WIDTH:
		for y in GRID_HEIGHT:
			var window: int = randi_range(0, 1)
			_building_layout.set_cell(
				Vector2i(x, y), 
				1, 
				Vector2i(window, 0)
			)
			
			if window == 0:
				# Window was spawned, can create interactable
				pass
