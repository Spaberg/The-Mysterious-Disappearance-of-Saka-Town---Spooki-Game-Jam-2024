extends Camera2D

var lookAheadDistance = 80.0
var lookAheadSpeed = 1.5
var lookOffset : float 
var velocity
var movingposition : Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	movingposition = Player.position
	movingposition.x += lookOffset
	movingposition.y -= 30
	position = movingposition
	velocity = Player.get_node("CharacterBody2D").velocity.x
	if(velocity>0):
		lookOffset = lerp(lookOffset,lookAheadDistance,lookAheadSpeed*delta)
	if(velocity<0):
		lookOffset = lerp(lookOffset,-lookAheadDistance,lookAheadSpeed*delta)
	pass
