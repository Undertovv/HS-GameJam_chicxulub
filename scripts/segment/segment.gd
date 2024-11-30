class_name Segment
extends Node2D

@onready
var _interaction_grid: TileMapLayer = $Interactions

func _ready() -> void:
	randomise_layout()

func randomise_layout() -> void:
	# TODO: Randomise the layouts and validate that you can complete them
	pass
