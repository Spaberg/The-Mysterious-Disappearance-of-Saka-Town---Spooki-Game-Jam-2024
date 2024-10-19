extends AudioStreamPlayer2D

var shift_range : int = 600
var dir : int = 1
var velocity : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x += velocity*delta

func _on_timer_timeout() -> void:
	global_position = Vector2(Player.position.x + (randf() - 0.5)*shift_range, Player.position.y)
	if(randf() > 0.5):
		dir = 1
	else:
		dir = -1
	velocity = randf()*50*dir
	play()
	$Timer.wait_time = 8 + randf() * 10
	$Timer.start()
	
