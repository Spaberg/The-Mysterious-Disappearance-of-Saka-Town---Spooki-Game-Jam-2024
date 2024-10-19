extends Node2D

var radio_pct : float = 0
var radio_triggereded : bool = false

enum DESTINATION {MountainTrailStart = 0, MountainTrailEnd, HospitalEntrance, CorridorEntrance}

var destination_coordinates = {
	DESTINATION.HospitalEntrance: Vector2(686,139),
	DESTINATION.MountainTrailStart: Vector2(24,66),
	DESTINATION.CorridorEntrance: Vector2(-612,-126),
}

signal radio_triggered

signal teleported

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
	if not radio_triggereded:
		print(radio_pct)
	if radio_pct > 0.8:
		if $RadioTrigger.is_stopped():
			$RadioTrigger.start()
	if radio_pct < 0.8:
		$RadioTrigger.stop()
		
func _on_radio_timeout():
	radio_triggered.emit()
	
func _on_radio_triggered():
	print("yeahhh!")
	radio_triggereded = true
	pass
