extends TextureButton

var frame = 0;

func _on_NextButton_pressed():
	if(frame == 0):
		get_node("../AnimationPlayer").play("JumpOut");
		get_node("../Label").text = "Swipe down to jump towards the inner Rings";
		frame = 1;
		return;
	elif(frame == 1):
		get_node("../AnimationPlayer").play("JumpIn");
		get_node("../Label").text = "Avoid all the Triangles! Now let's play!";
		get_node("../EnemySprite").set_visible(true);
		frame += 1;
		return;
	else:
		get_node("../PlayButton").set_visible(true);
		self.set_visible(false);
