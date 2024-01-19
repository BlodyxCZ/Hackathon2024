extends Control


@onready var button = $Panel/move_area

@onready var screen_size = DisplayServer.screen_get_size()
@onready var last_window_size = DisplayServer.window_get_size()
@onready var last_window_position = DisplayServer.window_get_position()

var contact_point = Vector2.ZERO
var moving_window = false


func _physics_process(delta):
	if Input.is_action_just_pressed("LMB"):
		contact_point = get_global_mouse_position()
	if (button.is_hovered() and Input.is_action_pressed("LMB")) or moving_window:
		moving_window = true
		DisplayServer.window_set_position((lerp(Vector2(DisplayServer.window_get_position()), get_global_mouse_position(), 0.5))*Vector2(2, 2) - contact_point)
	if Input.is_action_just_released("LMB"):
		moving_window = false


func _on_close_pressed():
	get_tree().quit()


func _on_max_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		last_window_position = DisplayServer.window_get_position()
		last_window_size = DisplayServer.window_get_size()
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		DisplayServer.window_set_size(last_window_size)
		DisplayServer.window_set_position(last_window_position)


func _on_min_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MINIMIZED)
