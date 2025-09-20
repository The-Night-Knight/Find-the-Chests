extends Control

func _on_volume_value_changed(value: float):
	AudioServer.set_bus_volume_db(0,value)

func _on_mute_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0,toggled_on)

func _on_brightness_value_changed(value: float) -> void:
	GlobalWorldEnvironment.environment.adjustment_brightness = value

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Start Scenes/Start.tscn")
