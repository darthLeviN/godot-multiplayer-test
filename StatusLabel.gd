extends Label

var counter: int = 0:
	set(value):
		counter = value
		text = str(counter)

@rpc("any_peer") func add_counter() -> void:
	counter += 1
