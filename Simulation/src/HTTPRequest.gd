extends HTTPRequest


@export var address: String = "https://www.nic.com/post"


func _on_request_completed(result, response_code, _headers, body) -> void:
	print("Result: %s \n Response code: %s" % [result, response_code])
	
	var json = JSON.new()
	json.parse(body.get_string_from_utf8())
	var response = json.get_data()
	print(response)



func POST(body: String) -> void:
	var error = request(address + "/post", [], HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")


func GET() -> void:
	var error = request(address + "/get")
	if error != OK:
		push_error("An error occurred in the HTTP request.")
