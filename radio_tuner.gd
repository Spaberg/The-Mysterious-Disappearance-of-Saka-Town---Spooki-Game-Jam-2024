extends Node2D

var radio_curve : Curve = load("res://radio_curve.tres")

func _process(delta):
	# mix static w/ broadcast
	Global.radio_pct = radio_curve.sample($Control/HSlider.value / 100.0)
	# emit signal on threshold (global can do this)
