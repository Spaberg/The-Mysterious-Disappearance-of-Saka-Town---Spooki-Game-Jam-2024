extends Node2D
var radio_pct : float = 0

enum DESTINATION {MountainTrailStart = 0, MountainTrailEnd, HospitalEntrance, CorridorEntrance}

var destination_coordinates = {
	DESTINATION.HospitalEntrance: Vector2(686,139),
	DESTINATION.MountainTrailStart: Vector2(24,66),
	DESTINATION.CorridorEntrance: Vector2(-612,-126),
}

signal teleported

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
