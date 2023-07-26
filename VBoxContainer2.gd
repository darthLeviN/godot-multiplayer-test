extends VBoxContainer

@onready var status_label = $StatusLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	var mp = SceneMultiplayer.new()
	get_tree().set_multiplayer(mp, get_path())



func _on_rpc_1_pressed():
	status_label.rpc("add_counter")

func _on_join_host_pressed():
	var peer := ENetMultiplayerPeer.new()
	
	peer.create_client("127.0.0.1", 8089)
	multiplayer.multiplayer_peer = peer
	
	
