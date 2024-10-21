extends Node2D

var player_has_moved
var player_has_reached_poster
var player_has_interacted
var player_has_reached_door
var player_has_used_door

@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var text_label : RichTextLabel = $CanvasLayer/RichTextLabel

func _ready():
	Global.player_reached_poster.connect(_on_player_reached_poster)
	Global.player_walked_away_from_poster.connect(_on_player_walked_away_from_poster)
	Global.player_interacted.connect(_on_player_interacted)
	Global.player_reached_door.connect(_on_player_reached_door)
	Global.player_walked_away_from_door.connect(_on_player_walked_away_from_door)
	Global.player_used_door.connect(_on_player_used_door)
	
	animation_player.play_backwards("fade_text")
	text_label.visible = true
	
	
	
func _process(delta):
	if not player_has_moved:
		if (Input.is_action_just_pressed("Move Left") or Input.is_action_just_pressed("Move Right")):
			player_has_moved = true
			animation_player.play("fade_text")
	
func _on_player_reached_poster():
	if not player_has_interacted:
		player_has_reached_poster = true
		animation_player.play_backwards("fade_text")
		$CanvasLayer/RichTextLabel.text = "[center]Press E to interact[/center]"
	
func _on_player_interacted():
	if not player_has_interacted:
		player_has_interacted = true
		animation_player.play("fade_text")
	
func _on_player_walked_away_from_poster():	
	if not player_has_interacted:
		animation_player.play("fade_text")

func _on_player_reached_door():
	if not player_has_used_door:
		player_has_reached_door = true
		$CanvasLayer/RichTextLabel.text = "[center]Press W to move up[/center]"
		animation_player.play_backwards("fade_text")
	
func _on_player_used_door():
	if not player_has_used_door:
		player_has_used_door = true
		animation_player.play("fade_text")
		
func _on_player_walked_away_from_door():
	if not player_has_used_door:
		animation_player.play("fade_text")
