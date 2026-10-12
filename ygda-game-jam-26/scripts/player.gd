extends CharacterBody2D

const SPEED = 125.0
const JUMP_VELOCITY = -350.0

var in_air: bool = false

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var walk_sfx: AudioStreamPlayer = $metalWalking
@onready var jump_sfx: AudioStreamPlayer = $jumpsound
@onready var floorhit_sfx: AudioStreamPlayer = $floorhit

func _ready() -> void:
	Spin.active_level = get_node("../Level 2")

func _physics_process(delta: float) -> void:
	if not Spin.in_door:
		if not is_on_floor():
			velocity += get_gravity() * delta
			
		if not is_on_floor():
			in_air = true
		if in_air and is_on_floor():
			in_air = false
			floorhit_sfx.play()
			

		# Handle jump.
		if Input.is_action_just_pressed("action_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			jump_sfx.play()

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("move_left", "move_right")
		
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
		
		
		
		if is_on_floor():
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
			
		
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	else:
		animated_sprite.play("in_door")


func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite.animation == "run":
		walk_sfx.pitch_scale = randf_range(0.85, 1.15)
		walk_sfx.play()
