extends Camera2D

var lookAheadDistance = 80.0
var lookAheadSpeed = 0.2
var lookOffset : float 
var velocity
var movingposition : Vector2
var poster_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.add_poster.connect(_on_add_poster)
	Global.remove_poster.connect(_on_remove_poster)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movingposition = Player.position
	movingposition.x += lookOffset
	movingposition.y -= 30*6
	position = movingposition
	#position.y = lerp(position.y, movingposition.y, lookAheadSpeed * delta)
	velocity = Player.get_node("CharacterBody2D").velocity.x
	if(velocity>0):
		lookOffset = lerp(lookOffset,lookAheadDistance,lookAheadSpeed*delta)
	if(velocity<0):
		lookOffset = lerp(lookOffset,-lookAheadDistance,lookAheadSpeed*delta)
	pass

func _on_add_poster(scene_instance):
	add_child(scene_instance)
	poster_scene = scene_instance
	
func _on_remove_poster():
	if poster_scene != null:
		poster_scene.queue_free()
