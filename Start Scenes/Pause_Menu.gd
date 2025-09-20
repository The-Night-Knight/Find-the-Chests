extends Node2D

@onready var pause_menu = $pause #change this for each instance
var paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Pause"):
		pause()

func pause():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
