extends TextureButton

func restart():
	# Start game
	var player = AudioStreamPlayer.new();
	add_child(player);
	player.stream = load("res://assets/sounds/Jump.wav");
	player.play();
	get_tree().change_scene("res://scenes/Ring.tscn");
	return;

func _on_TextureButton_pressed():
	restart();
