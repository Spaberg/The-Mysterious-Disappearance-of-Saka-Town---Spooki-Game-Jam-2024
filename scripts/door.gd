extends Node2D

@export var destination : Global.DESTINATION
var is_collision : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Move Up") and is_collision):
		await get_tree().create_timer(1).timeout 
		is_collision = false
		Global.teleported.emit(destination)
	pass

func _on_area_entered(area):
	#if area == player:
	is_collision = true

func _on_area_exited(area):
	#if area == player:
	is_collision = false
