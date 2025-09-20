extends Control

@onready var gold_label = $CanvasLayer/RichTextLabel
@onready var health_label = $CanvasLayer/RichTextLabel2

func _process(delta):
	gold_label.text = "Gold: " + str(GlobalInfo.gold)
	health_label.text = "Health: " + str(GlobalInfo.health)
