extends Node

func _ready():
	Player.get_child(0).velocity = Vector2.ZERO
	Player.get_child(0).global_position = Vector2(-4971, 300)	# Temp fix by Spaberg
