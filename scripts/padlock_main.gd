extends Control

# === NODE REFERENCES ===
@onready var code_entery_1: Label = $MarginContainer2/code_entery_1
@onready var code_entery_2: Label = $MarginContainer2/code_entery_2
@onready var code_entery_3: Label = $MarginContainer2/code_entery_3
@onready var code_entery_4: Label = $MarginContainer2/code_entery_4
@onready var code_entery_5: Label = $MarginContainer2/code_entery_5
@onready var code_entery_6: Label = $MarginContainer2/code_entery_6

@onready var padlock: Control = $"."  # Refers to this node
@onready var padlock_buttons: AudioStreamPlayer = $"../PadlockButtons"

# === SIGNALS ===
signal gate1
signal gate2
signal gate3
signal gate4
signal gate5
signal gate6

# === VARIABLES ===
var entered_code: String = ""

# === PRIVATE METHODS ===
func _append_digit(digit: String) -> void:
	if entered_code.length() < 4:
		entered_code += digit
		_update_code_labels()

func _update_code_labels() -> void:
	code_entery_1.text = entered_code
	code_entery_2.text = entered_code
	code_entery_3.text = entered_code
	code_entery_4.text = entered_code
	code_entery_5.text = entered_code
	code_entery_6.text = entered_code

# === BUTTON INPUT ===
func _on_button_0_pressed() -> void: _handle_digit("0")
func _on_button_1_pressed() -> void: _handle_digit("1")
func _on_button_2_pressed() -> void: _handle_digit("2")
func _on_button_3_pressed() -> void: _handle_digit("3")
func _on_button_4_pressed() -> void: _handle_digit("4")
func _on_button_5_pressed() -> void: _handle_digit("5")
func _on_button_6_pressed() -> void: _handle_digit("6")
func _on_button_7_pressed() -> void: _handle_digit("7")
func _on_button_8_pressed() -> void: _handle_digit("8")
func _on_button_9_pressed() -> void: _handle_digit("9")

func _handle_digit(digit: String) -> void:
	_append_digit(digit)
	padlock_buttons.play()

func _on_button_clear_pressed() -> void:
	entered_code = ""
	_update_code_labels()
	padlock_buttons.play()

func _on_back_pressed() -> void:
	padlock.hide()
	padlock_buttons.play()

# === ENTER CONFIRMATION ===
func _on_enter_1_pressed() -> void: emit_signal("gate1")
func _on_enter_2_pressed() -> void: emit_signal("gate2")
func _on_enter_3_pressed() -> void: emit_signal("gate3")
func _on_enter_4_pressed() -> void: emit_signal("gate4")
func _on_enter_5_pressed() -> void: emit_signal("gate5")
func _on_enter_6_pressed() -> void: emit_signal("gate6")
