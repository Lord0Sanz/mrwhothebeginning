extends Node3D

@onready var cam_1: Camera3D = $start_room/cam_1
@onready var cam_2: Camera3D = $control_room/cam_2
@onready var cam_3: Camera3D = $end_room/cam_3
@onready var cam_4: Camera3D = $big_room/cam_4
@onready var cam_5: Camera3D = $big_cell_room/cam_5
@onready var cam_6: Camera3D = $inside_room_1/cam_6
@onready var cam_7: Camera3D = $inside_room_2/cam_7
@onready var cam_8: Camera3D = $hallway_1/cam_8
@onready var cam_9: Camera3D = $hallway_2/cam_9
@onready var cam_10: Camera3D = $hallway_3/cam_10
@onready var cam_11: Camera3D = $hallway_4/cam_11

@onready var all_cameras: Array[Camera3D] = [
	cam_1, cam_2, cam_3, cam_4, cam_5, cam_6,
	cam_7, cam_8, cam_9, cam_10, cam_11
]

func activate_camera(cam: Camera3D) -> void:
	for c in all_cameras:
		c.current = false
	cam.current = true

# Connect all these signals in the editor or via code.
func _on_start_room_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_1)

func _on_control_room_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_2)

func _on_end_room_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_3)

func _on_big_room_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_4)

func _on_big_cell_room_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_5)

func _on_inside_room_1_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_6)

func _on_inside_room_2_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_7)

func _on_hallway_1_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_8)

func _on_hallway_2_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_9)

func _on_hallway_3_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_10)

func _on_hallway_4_body_entered(body: Node3D) -> void:
	if is_player(body): activate_camera(cam_11)

func is_player(body: Node3D) -> bool:
	return body.is_in_group("Player")
