extends Label

var score = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Score: " + str(score);
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score += delta;
	self.text = "Score: " + str(stepify(score * 10, 1));
	return;
