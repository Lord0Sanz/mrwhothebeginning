extends Node3D

# === NODE REFERENCES ===
@onready var clock_timer: Label = $SubViewport/clock_timer

# === SIGNALS ===
signal time_over

# === VARIABLES ===
var total_seconds: float = 0.0  # Use float for sub-second precision
var countdown_active := false

# === LIFECYCLE ===
func _ready() -> void:
	start_countdown(0, 20, 0)  

func _process(delta: float) -> void:
	if countdown_active and total_seconds > 0.0:
		total_seconds -= delta
		if total_seconds <= 0.0:
			total_seconds = 0.0
			countdown_active = false
			print("Time's up!")
			emit_signal("time_over")
		_update_clock_display()

# === COUNTDOWN CONTROL ===
func start_countdown(hours: int, minutes: int, seconds: int) -> void:
	total_seconds = float(hours * 3600 + minutes * 60 + seconds)
	countdown_active = true
	_update_clock_display()

# === DISPLAY UPDATE ===
func _update_clock_display() -> void:
	var remaining = int(total_seconds)
	@warning_ignore("integer_division")
	var hrs = remaining / 3600
	@warning_ignore("integer_division")
	var mins = (remaining % 3600) / 60
	var secs = remaining % 60

	clock_timer.text = "%02d:%02d:%02d" % [hrs, mins, secs]
