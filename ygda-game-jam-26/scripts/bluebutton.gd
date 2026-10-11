extends Area2D

@onready var Anime : AnimatedSprite2D = $AnimatedSprite2D
@onready var slide_sfx: AudioStreamPlayer = $Rockslide
@onready var hit_sfx: AudioStreamPlayer = $Rockhit

var has_pressed: bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Anime.play("On")
#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("test_turn") and not event.is_echo() and not is_rotating:
		#get_viewport().set_input_as_handled()
		#is_rotating = true
		#slide_sfx.play()
		#for rotations in 45:
			#rotation += deg_to_rad(2)
			#await get_tree().create_timer(0.0001).timeout
		#is_rotating = false
		#hit_sfx.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
		


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Anime.play("Pressed")
		if not has_pressed:
			Spin.is_rotating = true
		has_pressed = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		pass
