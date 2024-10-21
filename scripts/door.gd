extends Node2D

@export var destination : Global.DESTINATION
var is_collision : bool = false
@export var is_disabled = false
@export var is_rightie = false
var time_right_held_down = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player_wants_out = Input.is_action_pressed("Move Up") or (Input.is_action_pressed("Move Right") and is_rightie)
	if player_wants_out and is_collision and not Global.player_is_entering_door:
		Global.player_is_entering_door = true
		await get_tree().create_timer(2.5).timeout # wait period
		Global.player_used_door.emit()
		is_collision = false
		Global.teleported.emit(destination)
		await get_tree().create_timer(1.5).timeout # cooldown
		Global.player_is_entering_door = false

func _on_area_entered(area):
	Global.player_reached_door.emit()
	#if area == player:
	is_collision = true

func _on_area_exited(area):
	#if area == player:
	print("exited")
	Global.player_walked_away_from_door.emit()
	is_collision = false
