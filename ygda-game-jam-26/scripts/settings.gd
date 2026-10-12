extends Control


func _on_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_1.tscn")


func _on_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_2.tscn")


func _on_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_3.tscn")


func _on_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_4.tscn")


func _on_5_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_5.tscn")


func _on_6_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_6.tscn")


func _on_7_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_7.tscn")


func _on_8_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_8.tscn")


func _on_9_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_9.tscn")


func _on_10_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Levels/level_10.tscn")


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_music_pressed() -> void:
	if  Level2Buttons.sound_on:
		Level2Buttons.sound_on = false
		$Music.texture_normal = load("res://assets/LevelButtons/pixil-frame-0.png")
	else:
		Level2Buttons.sound_on = true
		$Music.texture_normal = load("res://assets/LevelButtons/pixil-frame-0_1.png")
