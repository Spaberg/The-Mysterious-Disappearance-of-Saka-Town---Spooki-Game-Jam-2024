extends CharacterBody2D

const run_speed := 60.0
var gravity := ProjectSettings.get("physics/2d/default_gravity") as float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().position = Vector2(141,35)
	Global.teleported.connect(_on_teleported)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction = Input.get_axis("Move Left","Move Right")
	velocity.x = direction * run_speed
	velocity.y += gravity * delta
	get_parent().position += position
	position = Vector2(0,0)
	move_and_slide()
	pass

func _on_teleported(destination):
	global_position = Global.destination_coordinates[destination]