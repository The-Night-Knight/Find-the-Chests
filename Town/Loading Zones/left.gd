extends Area2D

@export_file() var next_scene_path = ""
var can_teleport = false

func _ready():
	await get_tree().create_timer(0.2).timeout
	can_teleport = true

func _on_body_entered(body: Node2D) -> void:
	if can_teleport:
		GlobalInfo.player_inital_map_position = body.global_position - Vector2(-1100,0)
		get_tree().call_deferred("change_scene_to_file", next_scene_path)
