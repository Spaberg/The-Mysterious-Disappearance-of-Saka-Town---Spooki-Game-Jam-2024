extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.radio_triggered.connect(_on_radio_triggered)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_radio_triggered():
	
	pass
