extends HTTPRequest


var address: String = "https://www.nic.com/post"


func _on_request_completed(result, response_code, _headers, _body) -> void:
	print("Result: %s \n Response code: %s" % [result, response_code])


func POST(body: String) -> void:
	var error = request(address, [], HTTPClient.METHOD_POST, body)
	if error != OK:
		push_error("An error occurred in the HTTP request.")
