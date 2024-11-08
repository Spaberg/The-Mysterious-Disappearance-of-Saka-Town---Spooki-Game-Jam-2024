extends Node2D
var is_collision : bool = false
signal display_poster
var poster_scene = preload("res://scenes/poster.tscn")
@export var text : String
@export var picture : CompressedTexture2D
var poster_instance
var consumed = false
var toggle_question_mark_on_hide = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	poster_instance = poster_scene.instantiate()
	poster_instance.find_child("ColorRect").find_child("Text").text = "[center]" + text
	poster_instance.find_child("ColorRect").find_child("Picture").texture = picture

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
		poster_instance.find_child("ColorRect").find_child("Text").text = "[center]" + text
		poster_instance.find_child("ColorRect").find_child("Picture").texture = picture
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
