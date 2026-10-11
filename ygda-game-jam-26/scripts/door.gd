extends Area2D

@onready var Anime : AnimatedSprite2D = $AnimatedSprite2D
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
		tween.tween_property(body, "global_position", global_position, 1)
		await get_tree().create_timer(7).timeout
		get_tree().reload_current_scene()
