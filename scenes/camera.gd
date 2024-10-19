extends Camera2D

var lookAheadDistance = 5
var lookAheadSpeed = 3
var lookOffset 
var velocity
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = Player.position
	#position.x += lookOffset
	#velocity = get_parent().get_node("Player").get_node("CharacterBody2D").velocity.x
	#if(velocity>0):
		#lookOffset = lerp(lookOffset,lookAheadDistance,lookAheadSpeed*delta)
	#if(velocity<0):
		#lookOffset = lerp(lookOffset,-lookAheadDistance,lookAheadSpeed*delta)
	pass
