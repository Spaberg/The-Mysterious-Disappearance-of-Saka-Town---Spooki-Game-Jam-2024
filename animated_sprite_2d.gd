extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time= randi_range(1,3)


func _on_timer_timeout() -> void:
	play()
	pass # Replace with function body.
