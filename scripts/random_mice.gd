extends Node3D

@onready var mice_sounds: Array = [
	$mice_1,
	$mice_2,
	$mice_3,
	$mice_4,
	$mice_5,
	$mice_6,
	$mice_7,
	$mice_8
]

func _ready() -> void:
	randomize()
	_play_random_mice_sound()

func _play_random_mice_sound() -> void:
	var chosen_mice: AudioStreamPlayer3D = mice_sounds[randi() % mice_sounds.size()]
	chosen_mice.play()
	await get_tree().create_timer(40.0).timeout
	_play_random_mice_sound()
