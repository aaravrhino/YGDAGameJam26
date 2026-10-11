extends Area2D

var player_can_interact = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("test_turn") and player_can_interact:
			pass

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_can_interact = true
		print("player entered")


func _on_body_exited(body: Node2D) -> void:
	print("a")
	if body.is_in_group("player"):
		player_can_interact = false
		print("player exited")
