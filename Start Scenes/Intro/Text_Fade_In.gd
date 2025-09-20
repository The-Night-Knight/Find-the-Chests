extends Control

func _ready():
	$"Line 2".visible = false
	$"Line 3".visible = false
	$"Line 4".visible = false

func _on_texture_button_pressed() -> void:
	if $"Line 4".visible == true:
		get_tree().change_scene_to_file("res://Town/town_square.tscn")
	if $"Line 3".visible == true:
		$"Line 4".visible = true
	if $"Line 2".visible == true:
		$"Line 3".visible = true
	$"Line 2".visible = true
