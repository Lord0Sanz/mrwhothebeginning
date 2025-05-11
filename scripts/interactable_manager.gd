extends Node3D

@onready var dialogues: Label = $MarginContainer/dialogues

@onready var note_1: Area3D = $notes/Note_1
@onready var note_2: Area3D = $notes/Note_2
@onready var note_3: Area3D = $notes/Note_3
@onready var note_4: Area3D = $notes/Note_4
@onready var note_5: Area3D = $notes/Note_5

@onready var valve_handle_1: Area3D = $Valve/valve_handle_1
@onready var valve_handle_2: Area3D = $Valve/valve_handle_2
@onready var valve_handle_3: Area3D = $Valve/valve_handle_3
@onready var valve_handle_4: Area3D = $Valve/valve_handle_4

@onready var anim_valve_1: AnimationPlayer = $Valve/valve_holder_1/AnimationPlayer
@onready var anim_valve_2: AnimationPlayer = $Valve/valve_holder_2/AnimationPlayer
@onready var anim_valve_3: AnimationPlayer = $Valve/valve_holder_3/AnimationPlayer
@onready var anim_valve_4: AnimationPlayer = $Valve/valve_holder_4/AnimationPlayer

@onready var key_1: Area3D = $items/Key_1
@onready var key_2: Area3D = $items/Key_2

@onready var player_dialogue_base: ColorRect = $PlayerDialogue
@onready var player_dialogue: Label = $PlayerDialogue/PlayerDialogue

@onready var doors: AnimationPlayer = $Doors/door_6/Doors

@onready var valve_1: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/valve1"
@onready var valve_2: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/valve2"
@onready var valve_3: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/valve3"
@onready var valve_4: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/valve4"
@onready var key1: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/key1"
@onready var key2: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/key2"
@onready var coin: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/coin"
@onready var drink: Label = $"../UIManager/notes_reader/Inventory/MarginContainer2/VBoxContainer/drink"

@onready var notification_popup: Control = $"../UIManager/Notification"
@onready var item_equip: AudioStreamPlayer = $"../UIManager/ItemEquip"
@onready var paper_collect: AudioStreamPlayer = $"../UIManager/PaperCollect"
@onready var switch_button: AudioStreamPlayer = $"../UIManager/Switch_button"
@onready var pressure_valve: AudioStreamPlayer = $"../UIManager/Pressure_valve"
@onready var metal_door: AudioStreamPlayer = $"../UIManager/MetalDoor"
@onready var coin_insert: AudioStreamPlayer = $"../UIManager/CoinInsert"
@onready var vending_drink: AudioStreamPlayer = $"../UIManager/VendingDrink"

signal padlock_1
signal padlock_2
signal padlock_3
signal padlock_4
signal padlock_5
signal padlock_6

signal notefound_1
signal notefound_2
signal notefound_3
signal notefound_4
signal notefound_5

signal valvefound_1
signal valvefound_2
signal valvefound_3
signal valvefound_4

signal valvefixed_1
signal valvefixed_2
signal valvefixed_3
signal valvefixed_4

signal code_paper_1
signal code_paper_2
signal code_paper_3


var has_key_1: bool = false
var coin_taken_from_vault_1: bool = false
var has_coin: bool = false
var got_drink: bool = false
var gave_drink_to_man: bool = false
var has_key_2: bool = false
var paper_taken_from_vault_2: bool = false

func _ready() -> void:
	dialogues.text = ""
	notification_popup.hide()
	player_dialogue_base.show()
	player_dialogue.text = "Ahhh my Head hurts!!! WHERE AM I?"
	await get_tree().create_timer(3.0).timeout
	player_dialogue_base.hide()

func _on_padlock_1_mouse_entered() -> void:dialogues.text = "Padlock?"
func _on_padlock_1_mouse_exited() -> void:dialogues.text = ""
func _on_padlock_2_mouse_entered() -> void:dialogues.text = "Padlock?"
func _on_padlock_2_mouse_exited() -> void:dialogues.text = ""
func _on_padlock_3_mouse_entered() -> void:dialogues.text = "Padlock?"
func _on_padlock_3_mouse_exited() -> void:dialogues.text = ""
func _on_padlock_4_mouse_entered() -> void:dialogues.text = "Padlock?"
func _on_padlock_4_mouse_exited() -> void:dialogues.text = ""
func _on_padlock_5_mouse_entered() -> void:dialogues.text = "Padlock?"
func _on_padlock_5_mouse_exited() -> void:dialogues.text = ""
func _on_padlock_6_mouse_entered() -> void:dialogues.text = "Padlock?"
func _on_padlock_6_mouse_exited() -> void:dialogues.text = ""
func _on_note_1_mouse_entered() -> void:dialogues.text = "Note?"
func _on_note_1_mouse_exited() -> void:dialogues.text = ""
func _on_note_2_mouse_entered() -> void:dialogues.text = "Note?"
func _on_note_2_mouse_exited() -> void:dialogues.text = ""
func _on_note_3_mouse_entered() -> void:dialogues.text = "Note?"
func _on_note_3_mouse_exited() -> void:dialogues.text = ""
func _on_note_4_mouse_entered() -> void:dialogues.text = "Note?"
func _on_note_4_mouse_exited() -> void:dialogues.text = ""
func _on_note_5_mouse_entered() -> void:dialogues.text = "Note?"
func _on_note_5_mouse_exited() -> void:dialogues.text = ""
func _on_key_1_mouse_entered() -> void:dialogues.text = "Key?"
func _on_key_1_mouse_exited() -> void:dialogues.text = ""
func _on_key_2_mouse_entered() -> void:dialogues.text = "Key?"
func _on_key_2_mouse_exited() -> void:dialogues.text = ""
func _on_vault_2_mouse_entered() -> void:dialogues.text = "Vault?"
func _on_vault_2_mouse_exited() -> void:dialogues.text = ""
func _on_vault_1_mouse_entered() -> void:dialogues.text = "Vault?"
func _on_vault_1_mouse_exited() -> void:dialogues.text = ""
func _on_switch_mouse_entered() -> void:dialogues.text = "Exit Switch"
func _on_switch_mouse_exited() -> void:dialogues.text = ""
func _on_vending_mouse_entered() -> void:dialogues.text = "Vending Machine"
func _on_vending_mouse_exited() -> void:dialogues.text = ""
func _on_valve_handle_1_mouse_entered() -> void:dialogues.text = "Valve Handle"
func _on_valve_handle_1_mouse_exited() -> void:dialogues.text = ""
func _on_valve_handle_2_mouse_entered() -> void:dialogues.text = "Valve Handle"
func _on_valve_handle_2_mouse_exited() -> void:dialogues.text = ""
func _on_valve_handle_3_mouse_entered() -> void:dialogues.text = "Valve Handle"
func _on_valve_handle_3_mouse_exited() -> void:dialogues.text = ""
func _on_valve_handle_4_mouse_entered() -> void:dialogues.text = "Valve Handle"
func _on_valve_handle_4_mouse_exited() -> void:dialogues.text = ""
func _on_valve_holder_1_mouse_entered() -> void:dialogues.text = "Valve Base"
func _on_valve_holder_1_mouse_exited() -> void:dialogues.text = ""
func _on_valve_holder_2_mouse_entered() -> void:dialogues.text = "Valve Base"
func _on_valve_holder_2_mouse_exited() -> void:dialogues.text = ""
func _on_valve_holder_3_mouse_entered() -> void:dialogues.text = "Valve Base"
func _on_valve_holder_3_mouse_exited() -> void:dialogues.text = ""
func _on_valve_holder_4_mouse_entered() -> void:dialogues.text = "Valve Base"
func _on_valve_holder_4_mouse_exited() -> void:dialogues.text = ""
func _on_man_mouse_entered() -> void:dialogues.text = "Injured Man??"
func _on_man_mouse_exited() -> void:dialogues.text = ""



func _on_padlock_1_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("padlock_1")


func _on_padlock_2_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("padlock_2")


func _on_padlock_3_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("padlock_3")


func _on_padlock_4_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("padlock_4")


func _on_padlock_5_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("padlock_5")


func _on_padlock_6_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		emit_signal("padlock_6")


func _on_note_1_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		note_1.queue_free()
		dialogues.text = ""
		emit_signal("notefound_1")
		player_dialogue_base.show()
		player_dialogue.text = "Someone left a note?"
		paper_collect.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_note_2_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		note_2.queue_free()
		dialogues.text = ""
		emit_signal("notefound_2")
		player_dialogue_base.show()
		player_dialogue.text = "It seems like someone was here before?"
		paper_collect.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_note_3_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		note_3.queue_free()
		dialogues.text = ""
		emit_signal("notefound_3")
		player_dialogue_base.show()
		player_dialogue.text = "It seems like the pipes are hollow?!"
		paper_collect.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_note_4_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		note_4.queue_free()
		dialogues.text = ""
		emit_signal("notefound_4")
		player_dialogue_base.show()
		player_dialogue.text = "This man suffered a lot!?!"
		paper_collect.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_note_5_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		note_5.queue_free()
		dialogues.text = ""
		emit_signal("notefound_5")
		player_dialogue_base.show()
		player_dialogue.text = "Mr.Who? is shady?!?"
		paper_collect.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()



func _on_valve_handle_1_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		valve_handle_1.queue_free()
		dialogues.text = ""
		emit_signal("valvefound_1")
		valve_1.show()
		player_dialogue_base.show()
		player_dialogue.text = "This valve seems important"
		item_equip.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_handle_2_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		valve_handle_2.queue_free()
		dialogues.text = ""
		emit_signal("valvefound_2")
		valve_4.show()
		player_dialogue_base.show()
		player_dialogue.text = "So many Valves!!!"
		item_equip.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_handle_3_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		valve_handle_3.queue_free()
		dialogues.text = ""
		emit_signal("valvefound_3")
		valve_3.show()
		player_dialogue_base.show()
		player_dialogue.text = "Valve near a vending machine??"
		item_equip.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_handle_4_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		valve_handle_4.queue_free()
		dialogues.text = ""
		emit_signal("valvefound_4")
		valve_2.show()
		player_dialogue_base.show()
		player_dialogue.text = "Who keeps valves here"
		item_equip.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_holder_1_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		anim_valve_1.play("valve")
		emit_signal("valvefixed_1")
		valve_1.hide()
		dialogues.text = ""
		player_dialogue_base.show()
		player_dialogue.text = "Valve 1 fixed"
		pressure_valve.play()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_holder_2_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		anim_valve_2.play("valve")
		emit_signal("valvefixed_2")
		valve_2.hide()
		dialogues.text = ""
		player_dialogue_base.show()
		player_dialogue.text = "Valve 2 fixed"
		pressure_valve.play()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_holder_3_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		anim_valve_3.play("valve")
		emit_signal("valvefixed_3")
		valve_3.hide()
		dialogues.text = ""
		player_dialogue_base.show()
		player_dialogue.text = "Valve 3 fixed"
		pressure_valve.play()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_valve_holder_4_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		anim_valve_4.play("valve")
		emit_signal("valvefixed_4")
		valve_4.hide()
		dialogues.text = ""
		player_dialogue_base.show()
		player_dialogue.text = "Valve 4 fixed"
		pressure_valve.play()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_key_1_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		has_key_1 = true
		key_1.queue_free()
		key1.show()
		dialogues.text = ""
		player_dialogue_base.show()
		player_dialogue.text = "Vault Key found"
		item_equip.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_vault_1_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		player_dialogue_base.show()
		dialogues.text = ""

		if has_key_1 and not coin_taken_from_vault_1:
			player_dialogue.text = "Received scribbled note??, some coins"
			item_equip.play()
			_new_item()
			coin_taken_from_vault_1 = true
			key1.hide()
			has_coin = true
			coin.show()
			emit_signal("code_paper_1")
		elif has_key_1 and coin_taken_from_vault_1:
			player_dialogue.text = "It is empty"
		else:
			player_dialogue.text = "Hmmm I need a key to unlock it?"

		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_vending_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		player_dialogue_base.show()
		dialogues.text = ""

		if has_coin and not got_drink:
			vending_drink.play()
			coin_insert.play()
			player_dialogue.text = "Expired drink? Well... I should keep it."
			item_equip.play()
			_new_item()
			has_coin = false
			coin.hide()
			got_drink = true
			drink.show()
		elif got_drink:
			player_dialogue.text = "I wasted my coin here. There's nothing here!!!"
		else:
			player_dialogue.text = "Hmmm I need coins"

		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_man_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		player_dialogue_base.show()
		dialogues.text = ""

		if got_drink and not gave_drink_to_man:
			player_dialogue.text = "Thank you! Here, take this paper and\nGET OUT OF HERE before he shows up!"
			item_equip.play()
			_new_item()
			gave_drink_to_man = true
			drink.hide()
			emit_signal("code_paper_2") 
		elif gave_drink_to_man:
			player_dialogue.text = "What are you waiting for? GET OUT!"
		else:
			player_dialogue.text = "I aM ThiRsTY, Help me"

		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_key_2_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		has_key_2 = true
		key_2.queue_free()
		key2.show()
		dialogues.text = ""
		player_dialogue_base.show()
		player_dialogue.text = "Vault Key found"
		item_equip.play()
		_new_item()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _on_vault_2_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		player_dialogue_base.show()
		dialogues.text = ""

		if has_key_2 and not paper_taken_from_vault_2:
			player_dialogue.text = "Got a note with something scribbled on it..."
			item_equip.play()
			_new_item()
			paper_taken_from_vault_2 = true
			key2.hide()
			emit_signal("code_paper_3")  
		elif has_key_2 and paper_taken_from_vault_2:
			player_dialogue.text = "It's empty now."
		else:
			player_dialogue.text = "Hmmm I need a key to unlock it?"

		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_switch_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		player_dialogue_base.show()
		dialogues.text = ""
		doors.play("open")
		player_dialogue.text = "finally the exit is open!!!"
		switch_button.play()
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()


func _on_train_mouse_entered() -> void:dialogues.text = "Train??"
func _on_train_mouse_exited() -> void:dialogues.text = ""
func _on_train_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		player_dialogue_base.show()
		dialogues.text = ""
		player_dialogue.text = "A toy train Seriously!?!"
		await get_tree().create_timer(2.0).timeout
		player_dialogue_base.hide()

func _new_item() -> void:
	notification_popup.show()
	await get_tree().create_timer(0.5).timeout
	notification_popup.hide()
	await get_tree().create_timer(0.5).timeout
	notification_popup.show()
	await get_tree().create_timer(0.5).timeout
	notification_popup.hide()
	await get_tree().create_timer(0.5).timeout
	notification_popup.hide()
