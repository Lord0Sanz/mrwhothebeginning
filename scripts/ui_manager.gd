extends Node

# UI Components
@onready var notes_reader: ColorRect = $notes_reader
@onready var main: Control = $notes_reader/Main
@onready var padlock: Control = $Padlock

# Tabs
@onready var tabs := {
	"inventory": $notes_reader/Inventory,
	"notes": $notes_reader/Notes,
	"settings": $notes_reader/Settings,
	"map": $notes_reader/Map
}

# Sounds
@onready var turn_page_sound: AudioStreamPlayer = $TurnPage
@onready var ui_click_sound: AudioStreamPlayer = $UiClick

# Padlock Buttons
@onready var padlock_entery_1: Button = $Padlock/MarginContainer14/enter_1
@onready var padlock_entery_2: Button = $Padlock/MarginContainer14/enter_2
@onready var padlock_entery_3: Button = $Padlock/MarginContainer14/enter_3
@onready var padlock_entery_4: Button = $Padlock/MarginContainer14/enter_4
@onready var padlock_entery_5: Button = $Padlock/MarginContainer14/enter_5
@onready var padlock_entery_6: Button = $Padlock/MarginContainer14/enter_6

# Padlock Code Labels
@onready var code_entery_1: Label = $Padlock/MarginContainer2/code_entery_1
@onready var code_entery_2: Label = $Padlock/MarginContainer2/code_entery_2
@onready var code_entery_3: Label = $Padlock/MarginContainer2/code_entery_3
@onready var code_entery_4: Label = $Padlock/MarginContainer2/code_entery_4
@onready var code_entery_5: Label = $Padlock/MarginContainer2/code_entery_5
@onready var code_entery_6: Label = $Padlock/MarginContainer2/code_entery_6

# Inventory Notes
@onready var note_1: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/note1
@onready var note_2: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/note2
@onready var note_3: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/note3
@onready var note_4: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/note4
@onready var note_5: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/note5
@onready var codepage_1: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/codepage1
@onready var codepage_2: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/codepage2
@onready var codepage_3: Label = $notes_reader/Inventory/MarginContainer2/VBoxContainer/codepage3

# Page Nodes
@onready var page_nodes := [
	$notes_reader/Notes/MarginContainer/notepage_0,
	$notes_reader/Notes/MarginContainer/notepage_1,
	$notes_reader/Notes/MarginContainer/notepage_2,
	$notes_reader/Notes/MarginContainer/notepage_3,
	$notes_reader/Notes/MarginContainer/notepage_4,
	$notes_reader/Notes/MarginContainer/notepage_5,
	$notes_reader/Notes/MarginContainer/code_room_3,
	$notes_reader/Notes/MarginContainer/code_room_5,
	$notes_reader/Notes/MarginContainer/code_room_6
]

# State Variables
var pages: Array[int] = []
var current_page_index := 0
var note_visible := false

# Ready
func _ready():
	pages = [0]
	show_current_page()

# Page Display
func show_current_page() -> void:
	for i in range(page_nodes.size()):
		page_nodes[i].visible = (i == pages[current_page_index])

func add_page(index: int) -> void:
	if 0 in pages:
		pages.erase(0)
		page_nodes[0].visible = false
	if index not in pages:
		pages.append(index)
		pages.sort()
	current_page_index = pages.find(index)
	show_current_page()

# Input Handling
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("readnotes"):
		note_visible = !note_visible
		notes_reader.visible = note_visible

# Tabs
func show_tab(tab_name: String) -> void:
	@warning_ignore("shadowed_variable_base_class")
	for name in tabs:
		tabs[name].visible = name == tab_name

func _on_inventory_pressed() -> void: ui_click_sound.play(); show_tab("inventory")
func _on_notes_pressed() -> void: ui_click_sound.play(); show_tab("notes")
func _on_settings_pressed() -> void: ui_click_sound.play(); show_tab("settings")
func _on_map_pressed() -> void: ui_click_sound.play(); show_tab("map")

# Padlocks
func _show_padlock(index: int) -> void:
	padlock._on_button_clear_pressed()
	padlock.show()

	var codes = [code_entery_1, code_entery_2, code_entery_3, code_entery_4, code_entery_5, code_entery_6]
	var enters = [padlock_entery_1, padlock_entery_2, padlock_entery_3, padlock_entery_4, padlock_entery_5, padlock_entery_6]

	for i in range(6):
		codes[i].visible = i == index - 1
		enters[i].visible = i == index - 1

func _on_interactable_padlock_1() -> void: _show_padlock(1)
func _on_interactable_padlock_2() -> void: _show_padlock(2)
func _on_interactable_padlock_3() -> void: _show_padlock(3)
func _on_interactable_padlock_4() -> void: _show_padlock(4)
func _on_interactable_padlock_5() -> void: _show_padlock(5)
func _on_interactable_padlock_6() -> void: _show_padlock(6)

# Notes/Code Pages
func _on_interactable_notefound_1() -> void: add_page(1); note_1.show()
func _on_interactable_notefound_2() -> void: add_page(2); note_2.show()
func _on_interactable_notefound_3() -> void: add_page(3); note_3.show()
func _on_interactable_notefound_4() -> void: add_page(4); note_4.show()
func _on_interactable_notefound_5() -> void: add_page(5); note_5.show()

func _on_interactable_code_paper_1() -> void: add_page(6); codepage_1.show()
func _on_interactable_code_paper_2() -> void: add_page(7); codepage_2.show()
func _on_interactable_code_paper_3() -> void: add_page(8); codepage_3.show()

# Page Navigation
func _on_prev_pressed() -> void:
	turn_page_sound.play()
	if pages.size() > 0:
		current_page_index = max(0, current_page_index - 1)
		show_current_page()

func _on_next_pressed() -> void:
	turn_page_sound.play()
	if pages.size() > 0:
		current_page_index = min(pages.size() - 1, current_page_index + 1)
		show_current_page()

# Scene Control
func _on_restartlevel_pressed() -> void:
	get_tree().reload_current_scene()

func _on_mainmenu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
