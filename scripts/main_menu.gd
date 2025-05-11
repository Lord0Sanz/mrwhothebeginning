extends Node3D

@onready var main_menu: MarginContainer = $MainMenu
@onready var controls: MarginContainer = $Controls
@onready var ui_click: AudioStreamPlayer = $UiClick
@onready var intro: AudioStreamPlayer = $Intro
@onready var fade_anim: AnimationPlayer = $Fade_change/AnimationPlayer


func _ready() -> void:
	controls.hide()
	main_menu.show()

func _on_play_pressed() -> void:
	ui_click.play()
	main_menu.hide()
	await get_tree().create_timer(2.0).timeout
	intro.play()
	await get_tree().create_timer(24.7).timeout
	fade_anim.play("fade")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_controls_pressed() -> void:
	controls.show()
	main_menu.hide()
	ui_click.play()


func _on_back_pressed() -> void:
	main_menu.show()
	controls.hide()
	ui_click.play()
