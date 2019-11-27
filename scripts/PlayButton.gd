extends Button

func _on_PlayButton_pressed():
	restart();

func _on_RetryButton_pressed():
	get_tree().set_pause(false);
	restart();
	
func restart():
	# Start game
	var player = AudioStreamPlayer.new();
	add_child(player);
	player.stream = load("res://assets/sounds/Jump.wav");
	player.play();
	get_tree().change_scene("res://scenes/Ring.tscn");
	return;