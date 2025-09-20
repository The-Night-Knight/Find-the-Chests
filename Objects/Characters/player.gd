extends CharacterBody2D

var speed = 200

@onready var animated_sprite: AnimatedSprite2D = $Sprite
var last_direction = Vector2(0,1)

func _ready() -> void:
	if GlobalInfo.player_inital_map_position != Vector2.ZERO:
		global_position = GlobalInfo.player_inital_map_position
		GlobalInfo.player_inital_map_position = Vector2.ZERO

func _physics_process(_delta: float) -> void:
	var direction := Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	if direction.length() > 0:
		direction = direction.normalized()
		velocity = direction * speed
		last_direction = direction
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.y = move_toward(velocity.y, 0, speed)

	if direction.x > 0:
		animated_sprite.play("Right")
	elif direction.x < 0:
		animated_sprite.play("Left")
	elif direction.y > 0:
		animated_sprite.play("Down")
	elif direction.y < 0:
		animated_sprite.play("Up")
	else:
		if last_direction.x > 0:
			animated_sprite.play("Right Idle")
		elif last_direction.x < 0:
			animated_sprite.play("Left Idle")
		elif last_direction.y > 0:
			animated_sprite.play("Down Idle")
		elif last_direction.y < 0:
			animated_sprite.play("Up Idle")
	
	move_and_slide()

func move():
	if Input.is_action_pressed("ui_up"):
		pass
