extends AudioStreamPlayer

var fading := false

func _ready() -> void:
	volume_db = -50
	play()
	_fade_in()

func _process(_delta: float) -> void:
	if Spin.in_door and not fading:
		_fade_out()

func _fade_in() -> void:
	for i in range(35):
		if fading:
			return
		volume_db += 1
		await get_tree().create_timer(0.03).timeout

func _fade_out() -> void:
	fading = true

	for i in range(35):
		volume_db -= 1
		await get_tree().create_timer(0.03).timeout

	stop()
