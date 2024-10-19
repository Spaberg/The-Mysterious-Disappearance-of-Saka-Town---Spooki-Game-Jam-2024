extends Node2D
var is_collision : bool = false
signal display_poster
var poster_scene = preload("res://scenes/poster.tscn")
var poster_instance = poster_scene.instantiate()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	if (Input.is_action_just_released("Interact") and is_collision and not Global.pausing):
		is_collision = false
		Global.display_poster(poster_instance)
	elif (Input.is_action_just_released("Interact") and Global.pausing):
		Global.hide_poster()
		poster_instance = poster_scene.instantiate()
	pass

func _on_area_entered(area):
	#if area == player:
	is_collision = true

func _on_area_exited(area):
	#if area == player:
	is_collision = false
