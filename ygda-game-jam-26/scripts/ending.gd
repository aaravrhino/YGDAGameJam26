extends Node2D

@onready var Anim: AnimatedSprite2D = $ending_train

func _ready() -> void:
	Anim.play()

func _on_ending_train_animation_finished() -> void:
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
