extends Node2D
var is_collision : bool = false
signal display_poster
@export var poster_scene : PackedScene
var poster_instance
var consumed
var toggle_question_mark_on_hide = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	poster_instance = poster_scene.instantiate()
	pass # Replace with function body.


func _process(delta: float) -> void:
	
	if (Input.is_action_just_released("Interact") and is_collision and not Global.pausing):
		Global.player_interacted.emit()
		consumed = true
		Global.display_poster(poster_instance)
	elif (Input.is_action_just_released("Interact") and is_collision and Global.pausing):
		Global.hide_poster()
		if toggle_question_mark_on_hide:
			Player.get_node("CharacterBody2D").toggle_question_mark()
			toggle_question_mark_on_hide = false
		poster_instance = poster_scene.instantiate()
	pass

func _on_area_entered(area):
	if not consumed:
		Player.get_node("CharacterBody2D").toggle_question_mark()
	Global.player_reached_poster.emit()
	#if area == player:
	is_collision = true

func _on_area_exited(area):
	if not consumed:
		Player.get_node("CharacterBody2D").toggle_question_mark()
	Global.player_walked_away_from_poster.emit()
	#if area == player:
	is_collision = false
