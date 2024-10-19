extends PointLight2D

var time : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += 10 * delta
	energy = 1*(sin(time)+1)*0.4
	texture_scale = 4 + 9 * (sin(time*0.15)+1)*0.4


func _on_flicker_timer_timeout() -> void:
	enabled = !enabled
	$FlickerTimer.wait_time = randf()*0.6
	$FlickerTimer.start()
