extends Node2D

var radio_pct : float = 0
var radio_has_been_triggered : bool = false

enum DESTINATION {MountainTrailStart = 0, MountainTrailEnd, HospitalEntrance, CorridorEntrance,RadioRoomEntrance}
var pausing :bool=false
var destination_coordinates = {
	DESTINATION.HospitalEntrance: Vector2(-1809,1221),
	DESTINATION.MountainTrailStart: Vector2(24,66),
	DESTINATION.CorridorEntrance: Vector2(-1879,-440),
	DESTINATION.RadioRoomEntrance: Vector2(),
}

signal radio_triggered

signal teleported
signal add_poster
signal remove_poster

func display_poster(scene_instance):
	pausing = true
	add_poster.emit(scene_instance)

func hide_poster():
	pausing = false
	remove_poster.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	radio_triggered.connect(_on_radio_triggered)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# don't do this IRL
func set_radio_pct(value):
	radio_pct = value
	if not radio_has_been_triggered:
		print(radio_pct)
	if radio_pct > 0.8:
		if $RadioTrigger.is_stopped():
			$RadioTrigger.start()
	if radio_pct < 0.8:
		$RadioTrigger.stop()
		
func _on_radio_timeout():
	if not radio_has_been_triggered:
		radio_triggered.emit()
	
func _on_radio_triggered():
	print("yeahhh!")
	radio_has_been_triggered = true
	pass
