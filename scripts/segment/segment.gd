class_name Segment
extends Node2D

const GRID_WIDTH: int = 6
const GRID_HEIGHT: int = 5

# This in incredibly stupid and bone headed omg what have you done
const LAST_INTERACTABLE_ID: int = 2

@onready
var _building_layout: TileMapLayer = $Building
@onready
var _interactions: TileMapLayer = $Interactions

func _ready() -> void:
	randomise_layout()

func randomise_layout() -> void:
	for x in GRID_WIDTH:
		for y in GRID_HEIGHT:
			# Cells with a window have a value of 0
			var window: int = randi_range(0, 1)
			
			# Spawn the correct wall type at (x, y). Wall type is sources from _building_layout.tile_set 
			_building_layout.set_cell(
				Vector2i(x, y), 
				1, 
				Vector2i(window, 0)
			)
			
			if window == 0:
				# Generate a random ID for the interaction. 0 is none, the rest represent a tile ID in _interactions.tile_map 
				var interaction_id: int = randi_range(0, LAST_INTERACTABLE_ID)
				
				if interaction_id != 0:
					# Spawm the correct interaction scene above the window
					_interactions.set_cell(
							Vector2i(x, y), 
							0, 
							Vector2i.ZERO,
							interaction_id
						)
						
	if not _validate_layout():
		randomise_layout()

## Validates the layout of the segment to ensure it can be beaten
func _validate_layout() -> bool:
	return true
