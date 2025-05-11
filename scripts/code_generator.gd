extends Node

const NUM_PADLOCKS := 6
const PASSWORD_LENGTH := 4
const INVALID_PASSWORDS := [
	"0000", "1111", "2222", "3333",
	"4444", "5555", "6666", "7777",
	"8888", "9999"
]

@onready var code_room_1: Label = $"../MarginContainer/code_room_1/SubViewport/code_room_1"
@onready var code_room_2: Label = $"../MarginContainer/code_room_2/SubViewport/code_room_2"
@onready var code_room_3: Label = $"../MarginContainer/code_room_3/MarginContainer/code_room_3"
@onready var code_room_4: Label = $"../MarginContainer/code_room_4/SubViewport/code_room_4"
@onready var code_room_5: Label = $"../MarginContainer/code_room_5/MarginContainer/code_room_5"
@onready var code_room_6: Label = $"../MarginContainer/code_room_6/MarginContainer/code_room_6"

var padlock_passwords := {}

func _ready():
	randomize()
	generate_passwords()
	assign_passwords_to_labels()

func generate_passwords() -> void:
	var generated := []
	while generated.size() < NUM_PADLOCKS:
		var password := generate_password()
		if password in generated or password in INVALID_PASSWORDS:
			continue
		generated.append(password)
	for i in NUM_PADLOCKS:
		padlock_passwords["padlock_%d" % (i + 1)] = generated[i]

func generate_password() -> String:
	var result := ""
	for i in PASSWORD_LENGTH:
		result += str(randi() % 10)
	return result

func assign_passwords_to_labels() -> void:
	code_room_1.text = padlock_passwords["padlock_1"]
	code_room_2.text = padlock_passwords["padlock_2"]
	code_room_3.text = padlock_passwords["padlock_3"]
	code_room_4.text = padlock_passwords["padlock_4"]
	code_room_5.text = padlock_passwords["padlock_5"]
	code_room_6.text = padlock_passwords["padlock_6"]
