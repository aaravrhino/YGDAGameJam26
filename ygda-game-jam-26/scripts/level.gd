extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func rotate_level() -> void:
	get_viewport().set_input_as_handled()
	for rotations in 45:
		rotation += deg_to_rad(2)
		await get_tree().create_timer(0.0001).timeout
