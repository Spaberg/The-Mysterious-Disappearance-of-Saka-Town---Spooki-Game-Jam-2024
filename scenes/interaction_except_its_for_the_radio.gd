extends Node2D
var is_collision : bool = false
signal display_poster
var poster_scene = preload("res://scenes/radio.tscn")
var poster_instance
var consumed = false
@export var enabled : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.radio_triggered.connect(_on_radio_triggered)
	Global.radio_finished.connect(_on_radio_finished)
	poster_instance = poster_scene.instantiate()

func _process(delta: float) -> void:
	if (Input.is_action_just_released("Interact") and is_collision and not Global.pausing):
		Global.player_interacted.emit()
		Global.display_poster(poster_instance)
	elif (Input.is_action_just_released("Interact") and is_collision and Global.pausing and not consumed):
		Global.hide_poster()
		poster_instance = poster_scene.instantiate()

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

func _on_radio_triggered():
	consumed = true
	Player.get_node("CharacterBody2D").toggle_question_mark()
	
func _on_radio_finished():
	Global.hide_poster()
	poster_instance = poster_scene.instantiate()
