extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $Sprite2D
var player_in_range = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range = false

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("ui_accept") and GlobalInfo.has_key_4:
		animated_sprite.play("Open")
		GlobalInfo.gold += 25
		GlobalInfo.has_key_4 = false
		$RichTextLabel.text = "You found 25 gold!"
		await get_tree().create_timer(5).timeout
	if player_in_range and Input.is_action_just_pressed("ui_accept") and (GlobalInfo.has_key_1 or GlobalInfo.has_key_2 or GlobalInfo.has_key_3):
		$RichTextLabel.text = "You need a different key!"
		await get_tree().create_timer(5).timeout
		$RichTextLabel.text = ""
	if player_in_range and Input.is_action_just_pressed("ui_accept") and not GlobalInfo.has_key_1 and not GlobalInfo.has_key_2 and not GlobalInfo.has_key_3 and not GlobalInfo.has_key_4:
		$RichTextLabel.text = "You need a key!"
		await get_tree().create_timer(5).timeout
		$RichTextLabel.text = ""
		
