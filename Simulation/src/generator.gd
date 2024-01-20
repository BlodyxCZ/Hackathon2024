extends Button

signal generation_completed
signal members_completed

@onready var groups_spin = $groups
@onready var members_spin = $members
@onready var http_request = $HTTPRequest

var types = ["producer", "consumer"]
var members = []
var group_name
var current_member
var groups = []
var current_group


func generate_groups(groups_amount, members_amount):
	groups.clear()
	for i in groups_amount:
		generate_members(members_amount)
		await members_completed
		groups.append(current_group)
	generation_completed.emit()
	print(groups)


func generate_members(amount):
	members.clear()
	for i in amount:
		http_request.GET()
		await http_request.request_completed
		members.append(current_member)
	current_group = {
		"name": group_name,
		"members": members
	}
	members_completed.emit()

func _on_http_request_request_completed(_result, _response_code, _headers, body):
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	group_name = response["company"]
	current_member = {
		"name": response["name"],
		"address": response["address"].replacen("\n", " "),
		"phone": response["phone_w"],
		"type": types.pick_random(),
		"ean": floorf(randf_range(100000000000000000, 999999999999999999))
	}


func _on_pressed():
	generate_groups(groups_spin.value, members_spin.value)
