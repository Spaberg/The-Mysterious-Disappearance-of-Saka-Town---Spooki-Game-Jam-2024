extends Node2D

enum DESTINATION {MountainTrailStart = 0, MountainTrailEnd, HospitalEntrance, CorridorEntrance}
var pausing :bool=false
var destination_coordinates = {
	DESTINATION.HospitalEntrance: Vector2(686,139),
	DESTINATION.MountainTrailStart: Vector2(24,66),
	DESTINATION.CorridorEntrance: Vector2(-1072,-637),
}

signal teleported
signal add_poster

func display_poster(scene_instance):
	pausing=true
	#add_poster.emit(scene_instance)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
