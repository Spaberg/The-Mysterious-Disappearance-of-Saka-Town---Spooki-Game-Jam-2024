extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#position.x += 10
	#if(position.x < player.position.x + 360):
		#position.x = player.position.x - 360


func _on_timer_timeout() -> void:
	play()
	$Timer.wait_time = 8 + randf() * 15
	$Timer.start()
	
