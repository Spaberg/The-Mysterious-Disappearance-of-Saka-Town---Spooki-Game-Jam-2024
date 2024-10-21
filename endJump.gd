extends Node2D

@export var destination : Global.DESTINATION
var is_collision : bool = false
@export var is_disabled = false

var is_entering : bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_pressed("Move Up") and is_collision and Global.radio_has_been_triggered) and not is_entering and Player.get_child(0).get_child(3).frame == 2 and Player.get_child(0).get_child(3).animation == "turn":
		var end_scene = preload("res://scenes/endscene.tscn")
		get_tree().change_scene_to_packed(end_scene)	

func _on_area_entered(area):
	Global.player_reached_door.emit()
	#if area == player:
	is_collision = true

func _on_area_exited(area):
	#if area == player:
	print("exited")
	Global.player_walked_away_from_door.emit()
	is_collision = false
