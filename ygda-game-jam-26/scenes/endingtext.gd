extends Control

@onready var audio: AudioStreamPlayer = $endmusic

func _ready() -> void:
	audio.play()
	await get_tree().create_timer(7).timeout
	for i in 30:
		audio.volume_db += -1
		await get_tree().create_timer(0.1).timeout
	audio.stop()
	get_tree().change_scene_to_file("res://scenes/ending.tscn")
