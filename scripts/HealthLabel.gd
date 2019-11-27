extends Label

var player;

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_root().get_node("World/PlayerNode/PlayerBody");
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Health: " + str(player.health);
	return;
