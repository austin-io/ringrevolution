extends TextureButton

func _on_SoundButton_toggled(button_pressed):
	if(button_pressed):
		AudioServer.lock();
	else:
		AudioServer.unlock();
