extends Node2D

var player_in_range = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range = false

func _process(delta: float) -> void:
	if player_in_range and GlobalInfo.gold < 100 and not GlobalInfo.has_gear:
		$RichTextLabel.text = "You need more gold for gear! A hundred gold should do!"
	if player_in_range and GlobalInfo.gold >= 100 and not GlobalInfo.has_gear:
		$RichTextLabel.text = "You have enough gold! Do you want to buy some gear? (Press Enter to Accept)"
		if Input.is_action_just_pressed("ui_accept"):
			GlobalInfo.gold = 0
			GlobalInfo.has_gear = true
	if GlobalInfo.has_gear:
		$RichTextLabel.text = "Good luck on your adventure!"
