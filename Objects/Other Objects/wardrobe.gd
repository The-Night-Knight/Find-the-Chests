extends Node2D

var player_in_range = false
var stolen = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_in_range = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_in_range = false
	$RichTextLabel.text = ""

func _process(delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("ui_accept") and not stolen:
		GlobalInfo.gold += 1
		$RichTextLabel.text = "You little theif!"
		stolen = true
	
