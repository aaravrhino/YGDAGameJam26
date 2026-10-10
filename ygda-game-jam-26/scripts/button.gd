extends Area2D

var player_can_interact = false
var is_rotating = false

@onready var slide_sfx: AudioStreamPlayer = $rockslide
@onready var hit_sfx: AudioStreamPlayer = $rockhit
@export var level: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test_turn") and player_can_interact and not is_rotating:
			get_viewport().set_input_as_handled()
			is_rotating = true
			slide_sfx.play()
			level.rotate_level()
			for rotations in 45:
				rotation += deg_to_rad(2)
				await get_tree().create_timer(0.0001).timeout
			is_rotating = false
			hit_sfx.play()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_can_interact = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_can_interact = false
