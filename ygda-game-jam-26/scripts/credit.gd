extends Control


func _on_credits_button_pressed() -> void:
	print("clicked")
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
