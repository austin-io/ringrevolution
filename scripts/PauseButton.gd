extends Button

func _on_PauseButton_pressed():
	get_tree().get_root().get_node("World/PauseCanvas/PauseMenu").set_visible(true);
	get_tree().set_pause(true);
