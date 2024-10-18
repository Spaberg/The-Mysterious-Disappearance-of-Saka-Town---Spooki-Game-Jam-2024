extends PointLight2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_flicker_timer_timeout() -> void:
	enabled = !enabled
	$FlickerTimer.wait_time = randf()*0.5
	$FlickerTimer.start()
	
