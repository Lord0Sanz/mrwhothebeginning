extends Node3D

@onready var game_end: AudioStreamPlayer = $Gameend
@onready var spot_light: SpotLight3D = $SpotLight3D
@onready var label: Label = $MarginContainer/Label
@onready var label_2: Label = $MarginContainer/Label2
@onready var label_3: Label = $MarginContainer/Label3
@onready var label_4: TextureRect = $MarginContainer/Lable4
@onready var anim_fade: AnimationPlayer = $Fade_change/AnimationPlayer

func _ready() -> void:
	await get_tree().create_timer(1.0).timeout
	game_end.play()
	await get_tree().create_timer(25.0).timeout
	spot_light.show()
	await get_tree().create_timer(4.0).timeout
	spot_light.hide()
	await get_tree().create_timer(6.66).timeout
	label.show()
	await get_tree().create_timer(5.0).timeout
	label.hide()
	label_2.show()
	await get_tree().create_timer(5.0).timeout
	label_2.hide()
	label_3.show()
	await get_tree().create_timer(5.0).timeout
	label_3.hide()
	label_4.show()
	await get_tree().create_timer(5.0).timeout
	anim_fade.play("fade")
	label_4.hide()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
