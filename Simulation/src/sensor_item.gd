extends HBoxContainer


@onready var text = $text

var sensor_id: int = 0
var sensor_value: int = 0


func load_data(id: int = sensor_id, value: int = sensor_value):
	text.text = "sensor: id = %d, value = %d Wh" % [id, value]
	sensor_id = id
	sensor_value = value


func _on_remove_pressed():
	queue_free()
