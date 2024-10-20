extends CanvasLayer

var radio_curve : Curve = load("res://radio_curve.tres")

func _ready():
	$Control/HSlider.value = 100 * Global.radio_pct

func _process(delta):
	# mix static w/ broadcast
	Global.set_radio_pct(radio_curve.sample($Control/HSlider.value / 100.0))
	# emit signal on threshold (global can do this)
