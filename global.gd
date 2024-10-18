extends Node2D

enum DESTINATION {MountainTrailStart = 0, MountainTrailEnd, HospitalEntrance}

var destination_coordinates = {
	DESTINATION.HospitalEntrance: Vector2(0,0),
}

signal teleported

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
