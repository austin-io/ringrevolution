extends Button

func _on_QuitButton_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn");
	get_tree().set_pause(false);
	return;
