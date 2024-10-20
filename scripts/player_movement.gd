extends CharacterBody2D

@onready var sprite : AnimatedSprite2D = $Sprite

enum State {WALKING, STANDING, LOOKING, TURNING}

var player_state : State = State.STANDING


const run_speed := 30.0
var gravity := ProjectSettings.get("physics/2d/default_gravity") as float
var normalspawnposition = Vector2(-1566,178)
var testspawnposition = Vector2(-1072,-637)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().position = Vector2(-1737,289)
	Global.teleported.connect(_on_teleported)
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	var direction : float = Input.get_axis("Move Left","Move Right")
	
	if (player_state == State.STANDING) or (player_state == State.WALKING):
		
		velocity.x = direction * run_speed
		velocity.y += gravity * delta
		
		if abs(direction) > 0:
			# If trying to start walking in the direction faced.
			if (not sprite.flip_h and (direction > 0) or ((sprite.flip_h) and (direction < 0)) and player_state == State.STANDING):
				sprite.play("walk")
				player_state = State.WALKING
				
			# If trying to start walking opposite of the direction faced.
			elif (not sprite.flip_h and (direction < 0)) or (sprite.flip_h and (direction > 0)):
				sprite.play("spin")
				player_state = State.TURNING
				velocity.x = 0
				pass
				
		if abs(direction) == 0 and player_state == State.WALKING:
			player_state = State.STANDING
			sprite.play("default")
				
	if (player_state == State.STANDING):
		if (Input.is_action_just_pressed("Move Up")):
			player_state = State.LOOKING
			sprite.play("turn")

	
	get_parent().position += position
	position = Vector2(0,0)
	if not Global.pausing:
		move_and_slide()

func _on_teleported(destination):
	global_position = Global.destination_coordinates[destination]

func _on_sprite_animation_looped() -> void:
	if player_state == State.TURNING:
		sprite.play("default")
		if sprite.flip_h == true:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
		player_state = State.STANDING


func _on_sprite_animation_finished() -> void:	
	if player_state == State.LOOKING and sprite.frame == 0:
		sprite.play("default")
		player_state = State.STANDING
		
func _input(event):
	if event.is_action_released("Move Up") and player_state == State.LOOKING:
		sprite.play_backwards("turn")
		
		
