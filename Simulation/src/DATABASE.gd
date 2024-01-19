extends Node

# YYYY-MM-DD HH:MM:SS.MS

@onready var data: Array = [
	{
		"place_id": 0,
		"place_name": "Praha",
		"sensors": [
			{
				"sensor_id": 0,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 1,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 2,
				"sensor_value": randi_range(300, 1000)
			}
		]
	}, {
		"place_id": 1,
		"place_name": "Brno",
		"sensors": [
			{
				"sensor_id": 0,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 1,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 2,
				"sensor_value": randi_range(300, 1000)
			}
		]
	}, {
		"place_id": 2,
		"place_name": "Liberec",
		"sensors": [
			{
				"sensor_id": 0,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 1,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 2,
				"sensor_value": randi_range(300, 1000)
			}
		]
	}, {
		"place_id": 3,
		"place_name": "Ostrava",
		"sensors": [
			{
				"sensor_id": 0,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 1,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 2,
				"sensor_value": randi_range(300, 1000)
			}
		]
	}, {
		"place_id": 4,
		"place_name": "Plzeň",
		"sensors": [
			{
				"sensor_id": 0,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 1,
				"sensor_value": randi_range(300, 1000)
			}, {
				"sensor_id": 2,
				"sensor_value": randi_range(300, 1000)
			}
		]
	}
]
