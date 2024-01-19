extends Control


const SENSOR_ITEM = preload("res://sensor_item.tscn")

@onready var button = $Panel/move_area
@onready var http_request = $HTTPRequest
@onready var sensor_container = $Panel/sensors/sensors
@onready var id_select = $Panel/id_select
@onready var city_name = $Panel/add_city/city_name
@onready var sensor_value = $Panel/add_sensor/sensor_value

@onready var screen_size = DisplayServer.screen_get_size()
@onready var last_window_size = DisplayServer.window_get_size()
@onready var last_window_position = DisplayServer.window_get_position()

var contact_point = Vector2.ZERO
var moving_window = false

var place_id: int = 0
var sensors: Array = []


func _ready():
	for item in DB.data:
		id_select.add_item(item["place_name"])
	
	load_data(id_select.selected)


func _physics_process(_delta):
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


func _on_post_pressed():
	var body = get_data_as_string()
	http_request.POST(body)


func get_data_as_string() -> String:
	var data = {}
	data["place_id"] = id_select.selected
	data["sensors"] = []
	for sensor in sensors:
		var sensor_data = {}
		sensor_data["sensor_id"] = sensor.id
		sensor_data["sensor_value"] = sensor.value
		data["sensors"].append(sensor_data)
	return JSON.stringify(data)


func load_data(index) -> void:
	for child in sensor_container.get_children():
		child.queue_free()
	
	var data = DB.data[index]
	sensors = data["sensors"]
	for sensor in sensors:
		print(sensor)
		var s = SENSOR_ITEM.instantiate()
		sensor_container.add_child(s)
		s.load_data(sensor["sensor_id"],sensor["sensor_value"])


func _on_id_select_item_selected(index):
	load_data(index)


func _on_add_city_pressed():
	id_select.add_item(city_name.text)


func _on_add_sensor_pressed():
	pass # Replace with function body.
