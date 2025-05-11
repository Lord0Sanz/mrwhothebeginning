extends Node3D

signal game_end

# === Animation Players ===
@onready var anim_door_1 = $Interactable/Doors/door_1/Doors
@onready var anim_door_2 = $Interactable/Doors/door_2/Doors
@onready var anim_door_3 = $Interactable/Doors/door_3/Doors
@onready var anim_door_4 = $Interactable/Doors/door_4/Doors
@onready var anim_door_5 = $Interactable/Doors/door_5/Doors
@onready var anim_door_exit = $Interactable/Doors/Exitdoor/AnimationPlayer
@onready var animkey_1 = $Interactable/Valve/AnimationPlayer
@onready var end_faze = $UIManager/start/AnimationPlayer

# === Labels: Code Room ===
@onready var code_room_1 = $UIManager/notes_reader/Notes/MarginContainer/code_room_1/SubViewport/code_room_1
@onready var code_room_2 = $UIManager/notes_reader/Notes/MarginContainer/code_room_2/SubViewport/code_room_2
@onready var code_room_3 = $UIManager/notes_reader/Notes/MarginContainer/code_room_3/MarginContainer/code_room_3
@onready var code_room_4 = $UIManager/notes_reader/Notes/MarginContainer/code_room_4/SubViewport/code_room_4
@onready var code_room_5 = $UIManager/notes_reader/Notes/MarginContainer/code_room_5/MarginContainer/code_room_5
@onready var code_room_6 = $UIManager/notes_reader/Notes/MarginContainer/code_room_6/MarginContainer/code_room_6

# === Labels: Code Entry ===
@onready var code_entery_1 = $UIManager/Padlock/MarginContainer2/code_entery_1
@onready var code_entery_2 = $UIManager/Padlock/MarginContainer2/code_entery_2
@onready var code_entery_3 = $UIManager/Padlock/MarginContainer2/code_entery_3
@onready var code_entery_4 = $UIManager/Padlock/MarginContainer2/code_entery_4
@onready var code_entery_5 = $UIManager/Padlock/MarginContainer2/code_entery_5
@onready var code_entery_6 = $UIManager/Padlock/MarginContainer2/code_entery_6

# === UI and Audio ===
@onready var padlock = $UIManager/Padlock
@onready var right_password = $UIManager/RightPassword
@onready var wrong_password = $UIManager/WrongPassword
@onready var keys_fall = $UIManager/Keys_fall
@onready var metal_door = $UIManager/MetalDoor

# === Valve Logic ===
@onready var blocker = $Interactable/Valve/Blocker
var total_valves := 4
var found_valves := 0
var total_fix := 4
var completed_fix := 0

# === Padlock Functions ===
func _on_padlock_gate_1() -> void:
	_check_code(code_entery_1, code_room_1, anim_door_1)

func _on_padlock_gate_2() -> void:
	_check_code(code_entery_2, code_room_2, anim_door_2)

func _on_padlock_gate_3() -> void:
	_check_code(code_entery_3, code_room_3, anim_door_3)

func _on_padlock_gate_4() -> void:
	_check_code(code_entery_4, code_room_4, anim_door_4)

func _on_padlock_gate_5() -> void:
	_check_code(code_entery_5, code_room_5, anim_door_5)

func _on_padlock_gate_6() -> void:
	if code_entery_6.text == code_room_6.text:
		anim_door_exit.play("open")
		end_faze.play("end")
		right_password.play()
		await get_tree().create_timer(0.5).timeout
		emit_signal("game_end")
		padlock.hide()
	else:
		code_entery_6.text = "fail"
		wrong_password.play()
		await get_tree().create_timer(0.5).timeout
		padlock._on_button_clear_pressed()

func _check_code(entry: Label, target: Label, door_anim: AnimationPlayer) -> void:
	if entry.text == target.text:
		door_anim.play("open")
		entry.text = "pass"
		right_password.play()
		metal_door.play()
		await get_tree().create_timer(0.5).timeout
		padlock.hide()
	else:
		entry.text = "fail"
		wrong_password.play()
		await get_tree().create_timer(0.5).timeout
		padlock._on_button_clear_pressed()

# === Valve Found Events ===
func _on_interactable_valvefound_1(): _valve_found()
func _on_interactable_valvefound_2(): _valve_found()
func _on_interactable_valvefound_3(): _valve_found()
func _on_interactable_valvefound_4(): _valve_found()

# === Valve Fixed Events ===
func _on_interactable_valvefixed_1(): _valve_fixed()
func _on_interactable_valvefixed_2(): _valve_fixed()
func _on_interactable_valvefixed_3(): _valve_fixed()
func _on_interactable_valvefixed_4(): _valve_fixed()

# === Valve Logic ===
func _valve_found() -> void:
	found_valves += 1
	if found_valves == total_valves:
		blocker.queue_free()

func _valve_fixed() -> void:
	completed_fix += 1
	if completed_fix == total_fix:
		animkey_1.play("key found")
		keys_fall.play()

# === Timer / Ending ===
func _on_clock_time_over() -> void:
	end_faze.play("end")
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")

func _on_game_end() -> void:
	get_tree().change_scene_to_file("res://scenes/game_ending.tscn")
