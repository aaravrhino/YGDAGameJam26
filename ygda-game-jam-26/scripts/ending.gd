extends Node2D

@onready var Anim: AnimatedSprite2D = $ending_train

func _ready() -> void:
	Anim.play()
