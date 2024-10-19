extends Sprite2D

func _process(_delta):
	$RadioVoices.volume_db = lerp(-80, 0, Global.radio_pct)
	$RadioVoiceAndNoise.volume_db = lerp(0, -80, Global.radio_pct)
