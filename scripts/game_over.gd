extends Node3D

@onready var randomtitle: Label = $ColorRect/MarginContainer/VBoxContainer/randomtitle
@onready var ui_click: AudioStreamPlayer = $UiClick
@onready var anim_fade: AnimationPlayer = $Fade_change/AnimationPlayer

var taunt_lines := [
	"Oh... that was it? Pathetic.",
	"You call *that* trying?",
	"Back to the start, champ. You’ve earned nothing.",
	"Give up now—it’s clearly above your level.",
	"Even a blindfolded fool could've done better.",
	"So much time… so little progress.",
	"I've seen houseplants solve puzzles faster.",
	"Too hard for you? Go play something easier.",
	"You're not stuck. You're just not smart enough.",
	"Every second you wasted was proof you're not ready.",
	"That performance? Embarrassing.",
	"Did you think you'd win by guessing?",
	"You’re not trapped—you’re just incompetent.",
	"Keep trying. I need the laughs.",
	"This room isn’t locked. Your mind is.",
	"Maybe puzzles just aren’t your thing.",
	"You’re not escaping. You’re exactly where you belong.",
	"It’s cute you thought you had a chance.",
	"Retry? Or admit you're just not clever enough?",
	"Failure suits you. Almost like it was meant to be."
]


func _ready() -> void:
	# Pick a random taunt when the game over screen loads
	randomtitle.text = taunt_lines[randi() % taunt_lines.size()]

func _on_retry_pressed() -> void:
	ui_click.play()
	anim_fade.play("fade")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_mainmenu_pressed() -> void:
	ui_click.play()
	anim_fade.play("fade")
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	
