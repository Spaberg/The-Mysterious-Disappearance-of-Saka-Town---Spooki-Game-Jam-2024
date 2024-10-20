extends Node2D

var emergency_broadcast = preload("res://audio/environment/radio/radio_message.wav")

func _process(_delta):
	Global.radio_triggered.connect(_on_radio_triggered)
	$RadioVoices.volume_db = lerp(-80, 0, Global.radio_pct)
	$RadioVoiceAndNoise.volume_db = lerp(0, -80, Global.radio_pct)

func _on_radio_triggered():
	await get_tree().create_timer(7).timeout
	$RadioVoices.stream = emergency_broadcast
	$RadioVoices.play()
	
func _on_radio_finished():
	Global.radio_finished.emit()
	print("finished")
	pass
