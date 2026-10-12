extends TileMapLayer

var is_rotating: bool = false

@onready var slide_sfx: AudioStreamPlayer = $rockslide
@onready var hit_sfx: AudioStreamPlayer = $rockhit

func _process(_delta: float) -> void:
	if is_rotating:
		return

	if Spin.active_level != get_parent():
		return

	if Spin.blue_is_rotating or Spin.red_is_rotating:
		Spin.blue_is_rotating = false
		Spin.red_is_rotating = false
		rotate_level()


func rotate_level() -> void:
	if is_rotating:
		return

	is_rotating = true
	slide_sfx.play()

	for rotations in 45:
		rotation += deg_to_rad(2)
		await get_tree().create_timer(0.0001).timeout

	is_rotating = false
	hit_sfx.play()


func _on_spikes_tree_entered() -> void:
	pass # Replace with function body.
