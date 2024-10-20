extends Node2D

var player_has_moved
var player_has_reached_poster
var player_has_interacted
var player_has_reached_door
var player_has_used_door

func _ready():
	Global.player_reached_poster.connect(_on_player_reached_poster)
	Global.player_walked_away_from_poster.connect(_on_player_walked_away_from_poster)
	Global.player_interacted.connect(_on_player_interacted)
	Global.player_reached_door.connect(_on_player_reached_door)
	Global.player_walked_away_from_door.connect(_on_player_walked_away_from_door)
	Global.player_used_door.connect(_on_player_used_door)
	
	
func _process(delta):
	if not player_has_moved:
		if (Input.is_action_just_pressed("Move Left") or Input.is_action_just_pressed("Move Right")):
			player_has_moved = true
			$CanvasLayer/RichTextLabel.visible = false
	
func _on_player_reached_poster():
	if not player_has_interacted:
		player_has_reached_poster = true
		$CanvasLayer/RichTextLabel.visible = true
		$CanvasLayer/RichTextLabel.text = "[center]Press E to interact[/center]"
	
func _on_player_interacted():
	if not player_has_interacted:
		player_has_interacted = true
		$CanvasLayer/RichTextLabel.visible = false
	
func _on_player_walked_away_from_poster():	
	$CanvasLayer/RichTextLabel.visible = false

func _on_player_reached_door():
	if player_has_interacted and not player_has_used_door:
		player_has_reached_door = true
		$CanvasLayer/RichTextLabel.visible = true
		$CanvasLayer/RichTextLabel.text = "[center]Press W to move up[/center]"
	
func _on_player_used_door():
	if not player_has_used_door:
		player_has_used_door = true
		$CanvasLayer/RichTextLabel.visible = false
		
func _on_player_walked_away_from_door():
	$CanvasLayer/RichTextLabel.visible = false
