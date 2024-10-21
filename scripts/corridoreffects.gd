extends Node2D

var sliding_door_triggered : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.radio_finished.connect(_on_radio_finished)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_radio_triggered():
	#$Door/AudioStreamPlayer2D.play()
	pass

func _on_radio_finished():
	print("finish")
	$Sprite2D/TubeLight.visible = true
	$Sprite2D/TubeLight/FlickeringLightSound.play()
	$Sprite2D/LightOccluder2D.visible = true
	$Sprite2D/closed_door.visible = false
	# $Sprite2D/brightlight.color = Color(0,0,0.55,1)

func _on_area_entered(area):
	if not sliding_door_triggered:
		sliding_door_triggered = true
		%AnimatedDoor.play("moving")
		%ClosedSlidingDoor.visible = false
		%Radio.attenuation = 5
