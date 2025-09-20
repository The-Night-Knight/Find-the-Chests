extends Node2D

func _ready() -> void:
	if Music.playing == false:
		Music.play_music_start()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Start Scenes/Intro/Intro.tscn")

func _on_info_button_pressed():
	get_tree().change_scene_to_file("res://Start Scenes/Info.tscn")

func _on_settings_button_pressed():
	get_tree().change_scene_to_file("res://Start Scenes/Settings.tscn")
