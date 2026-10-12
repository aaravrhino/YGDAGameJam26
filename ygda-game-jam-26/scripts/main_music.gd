extends AudioStreamPlayer

@onready var audio: AudioStreamPlayer = $"."

func _ready() -> void:
	audio.volume_db = -15
	audio.play()

func _process(delta: float) -> void:
	if Spin.in_door:
		_fade_out()
		
func _fade_out():
	for i in 50:
		audio.volume_db += -0.01
		await get_tree().create_timer(0.1).timeout
