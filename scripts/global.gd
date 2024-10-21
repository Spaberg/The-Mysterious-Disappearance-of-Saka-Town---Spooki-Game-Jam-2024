extends Node2D

var resolution_scale : int = 6

var radio_pct : float = 0
var radio_has_been_triggered : bool = false
var radio_is_finished : bool = false
var player_is_entering_door : bool = false

enum DESTINATION {MountainTrailStart = 0, MountainTrailEnd, HospitalEntrance, CorridorEntrance,RadioRoomEntrance,RadioRoomOut}
var pausing :bool=false
var destination_coordinates = {
	DESTINATION.HospitalEntrance: Vector2(-5674,19960),
	DESTINATION.MountainTrailStart: Vector2(2341,1397),
	DESTINATION.CorridorEntrance: Vector2(-6048,14430),
	DESTINATION.RadioRoomEntrance: Vector2(-5044,5327),
	DESTINATION.RadioRoomOut: Vector2(-3259,14421),
}

# When you took a course in signal processing
signal radio_triggered
signal teleported
signal add_poster
signal remove_poster
signal player_reached_poster
signal player_interacted
signal player_reached_door
signal player_used_door
signal player_walked_away_from_poster
signal player_walked_away_from_door
signal sliding_door_triggered
signal radio_finished

func display_poster(scene_instance):
	pausing = true
	add_poster.emit(scene_instance)

func hide_poster():
	pausing = false
	remove_poster.emit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	radio_triggered.connect(_on_radio_triggered)
	radio_finished.connect(_on_radio_finished)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# don't do this IRL
func set_radio_pct(value):
	radio_pct = value
	if not radio_has_been_triggered:
		print(radio_pct)
	if radio_pct > 0.7:
		if $RadioTrigger.is_stopped():
			$RadioTrigger.start()
	if radio_pct < 0.7:
		$RadioTrigger.stop()
		
func _on_radio_timeout():
	if not radio_has_been_triggered:
		radio_triggered.emit()
	
func _on_radio_triggered():
	print("yeahhh!")
	radio_has_been_triggered = true
	pass

func _on_radio_finished():
	radio_is_finished = true
