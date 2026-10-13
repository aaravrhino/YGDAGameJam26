extends Control

@onready var audio: AudioStreamPlayer = $musicbegin

func _ready() -> void:
	audio.play()
	await get_tree().create_timer(15).timeout
	for i in 30:
		audio.volume_db += -1
		await get_tree().create_timer(0.1).timeout
	get_tree().change_scene_to_file("res://scenes/Levels/level_1.tscn")
