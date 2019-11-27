extends Tween

var shakePriority = 0;

func _ready():
	return;

func moveCamera(distance):
	get_parent().get_node("MainCamera").offset = Vector2(rand_range(-distance.x, distance.x), rand_range(-distance.y, distance.y));

func shake(power, duration, priority):
	if(priority > shakePriority):
		self.shakePriority = priority;
		self.interpolate_method(self, "moveCamera", Vector2(power, power), Vector2(0,0), duration, Tween.TRANS_SINE, Tween.EASE_OUT, 0);
		self.start();
	return;

func _on_ScreenShake_tween_completed(object, key):
	self.shakePriority = 0;
	return;
