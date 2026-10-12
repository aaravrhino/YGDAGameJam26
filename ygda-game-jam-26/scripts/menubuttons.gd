extends Control


@onready var player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	if Level2Buttons.sound_on:
		player.play()

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_play_pressed() -> void:
	player.stop()
	get_tree().change_scene_to_file("res://scenes/Levels/level_1.tscn")

func _on_credits_pressed() -> void:
	pass
