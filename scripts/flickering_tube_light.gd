extends PointLight2D

var time : float = 0
@onready var smallest_scale : float = texture_scale

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time += 10 * delta
	energy = 1*(sin(time)+1)*0.4
	texture_scale = smallest_scale + 2 * (sin(time*0.15)+1)*0.4

func _on_flicker_timer_timeout() -> void:
	enabled = !enabled
	$FlickerTimer.wait_time = randf()*0.6
	$FlickerTimer.start()
