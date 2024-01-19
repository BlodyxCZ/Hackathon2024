extends HBoxContainer


@onready var text = $text

var sensor_id: int
var sensor_value: int


func load_data(id: int, value: int):
	text.text = "sensor: id = %d, value = %d" % [id, value]
	sensor_id = id
	sensor_value = value


func _on_remove_pressed():
	queue_free()
