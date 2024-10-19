extends AudioStreamPlayer2D

var shift_range : float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	global_position = Vector2(Player.position.x + (randf())*shift_range, Player.position.y)
	play()
	$Timer.wait_time = 6 + randf() * 8
	$Timer.start()
