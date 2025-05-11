extends CharacterBody3D

@export var move_speed := 5.0
@export var rotate_speed := 2.0  # In radians per second
@onready var anim: AnimationPlayer = $player/AnimationPlayer
@onready var footsteps: AudioStreamPlayer = $Footsteps

func _physics_process(delta):
	# Handle rotation (A/D)
	if Input.is_action_pressed("move_right"):
		rotation.y -= rotate_speed * delta
	elif Input.is_action_pressed("move_left"):
		rotation.y += rotate_speed * delta

	# Handle forward/backward movement (W/S)
	var direction = Vector3.ZERO
	var is_moving = false

	if Input.is_action_pressed("move_forward"):
		direction += transform.basis.z
		play_anim("walkforward")
		is_moving = true
	elif Input.is_action_pressed("move_backward"):
		direction -= transform.basis.z
		play_anim("walkbackward")
		is_moving = true

	# Play idle if not moving
	if not is_moving:
		play_anim("idle")

	# Play/stop footstep audio
	if is_moving:
		if not footsteps.playing:
			footsteps.play()
	else:
		if footsteps.playing:
			footsteps.stop()

	# Apply horizontal movement
	direction = direction.normalized()
	velocity.x = direction.x * move_speed
	velocity.z = direction.z * move_speed
	velocity.y = 0

	move_and_slide()

@warning_ignore("shadowed_variable_base_class")
func play_anim(name: String) -> void:
	if anim.current_animation != name:
		anim.play(name)
