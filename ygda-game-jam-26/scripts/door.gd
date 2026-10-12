extends Area2D

@onready var Anime : AnimatedSprite2D = $AnimatedSprite2D
@onready var door_sfx: AudioStreamPlayer = $doorsound
@export var next_level: String = "res://scenes/Levels/level_2.tscn"
@export var button_amount: int = 1

func _ready() -> void:
	Level2Buttons.buttons_pressed = 0
	Level2Buttons.button_goal = button_amount

var player_can_interact = false
var door_opened = false

func _process(_delta: float) -> void:
	if not player_can_interact and not door_opened:
		Anime.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not door_opened:
		player_can_interact = true
		print("player entered")
		Anime.play("opening")
		door_opened = true
		var tween = get_tree().create_tween()
		tween.tween_property(body, "global_position", global_position, 6)
		Spin.in_door = true
		door_sfx.play()
		tween.tween_property(body, "global_position", global_position, 1)
		await get_tree().create_timer(7).timeout
		Spin.in_door = false
		#if get_tree().current_scene("res://scenes/Levels/level_1.tscn"):
		#next_level = "res://scenes/Levels/level_2.tscn"
		get_tree().change_scene_to_file(next_level)
