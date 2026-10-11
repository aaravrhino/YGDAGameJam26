extends Area2D

@onready var Anime : AnimatedSprite2D = $AnimatedSprite2D
var player_can_interact = false

func _process(delta: float) -> void:
	if not player_can_interact:
		Anime.play("idle")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_can_interact = true
		print("player entered")
		Anime.play("open")
