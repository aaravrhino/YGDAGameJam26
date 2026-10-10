extends TileMapLayer

var is_rotating: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test_turn") and not event.is_echo() and not is_rotating:
		get_viewport().set_input_as_handled()
		is_rotating = true
		for rotations in 45:
			rotation += deg_to_rad(2)
			await get_tree().create_timer(0.0001).timeout
		is_rotating = false
