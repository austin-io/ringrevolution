extends Button

func _on_ResumeButton_pressed():
	get_parent().get_parent().set_visible(false);
	get_tree().set_pause(false);
