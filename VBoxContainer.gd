extends VBoxContainer

@onready var status_label = $StatusLabel
@onready var character_stub

var counter := 0:
	set(value):
		counter = value
		character_stub.text = str(counter)

# Called when the node enters the scene tree for the first time.
func _ready():
	var mp = SceneMultiplayer.new()
	get_tree().set_multiplayer(mp, get_path())


func _on_host_button_pressed():
	var peer := ENetMultiplayerPeer.new()
	peer.create_server(8089)
	
	multiplayer.multiplayer_peer = peer
	
	character_stub = preload("res://multiplayer_control.tscn").instantiate()
	character_stub.text = "BEEEE"
	$Control.add_child(character_stub)
	


func _on_rpc_1_pressed():
	status_label.rpc("add_counter")
	counter += 1



