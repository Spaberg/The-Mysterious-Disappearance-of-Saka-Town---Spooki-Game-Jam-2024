extends AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	if(Player.global_position.distance_to(global_position) > 85 or (Player.global_position.distance_to(global_position) > 50 and Player.find_child("Sprite").flip_h	)):
		play()
	$Timer.wait_time = 6 + randf() * 9
	$Timer.start()
