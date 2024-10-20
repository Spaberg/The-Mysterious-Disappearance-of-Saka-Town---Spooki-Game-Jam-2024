extends AudioStreamPlayer2D

var shift_range : int = 600 * Global.resolution_scale
var velocity : int
var min_velocity : float = 10.0
var max_added_velocity : float = 60.0 * Global.resolution_scale
@onready var audio_length : float = 8.0 * Global.resolution_scale
var min_wait_time : float = 6.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += velocity*delta

func _on_timer_timeout() -> void:
	global_position = Vector2(Player.position.x + (randf() - 0.5)*shift_range, Player.position.y - 20)
	velocity = (min_velocity + randf() * max_added_velocity)*(randf()-0.5)*2
	play()
	$Timer.wait_time = audio_length + min_wait_time + randf() * 12
	$Timer.start()
	
