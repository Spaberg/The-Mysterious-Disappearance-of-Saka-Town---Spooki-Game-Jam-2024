extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.visible = true
	$AnimatedSprite2D.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D2.visible = true
	$AnimatedSprite2D2.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D3.visible = true
	$AnimatedSprite2D3.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D4.visible = true
	$AnimatedSprite2D4.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D5.visible = true
	$AnimatedSprite2D5.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D6.visible = true
	$AnimatedSprite2D6.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D7.visible = true
	$AnimatedSprite2D7.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D8.visible = true
	$AnimatedSprite2D8.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D9.visible = true
	$AnimatedSprite2D9.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D10.visible = true
	$AnimatedSprite2D10.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D11.visible = true
	$AnimatedSprite2D11.play()
	await get_tree().create_timer(randf()).timeout
	$AnimatedSprite2D12.visible = true
	$AnimatedSprite2D12.play()


func _on_the_end_timeout():
	$ColorRect.visible = true
