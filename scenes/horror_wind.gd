extends AudioStreamPlayer2D

@onready var audio_length : float = 18.0
var min_wait_time : float = 3.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	play()
	$Timer.wait_time = audio_length + min_wait_time + randf()*25
	$Timer.start()
