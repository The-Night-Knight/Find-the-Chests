extends Node2D

var player_in_range = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range = false

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("ui_accept") and not GlobalInfo.has_key_4:
		GlobalInfo.has_key_4 = true
		$Key.queue_free()
	if player_in_range and Input.is_action_just_pressed("ui_accept") and GlobalInfo.has_key_4:
		$Key/RichTextLabel.text = "You already have this key!"
