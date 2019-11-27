extends Area2D

const RING_DISTANCE = 75;

var origin = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
var radius;
var angle;
var stream;

func _ready():
	randomize();
	angle = rand_range(30, 150) * PI / 180;
	radius = (randi() % 3 + 1) * RING_DISTANCE + 50;
	stream = get_tree().get_root().get_node("World/SoundNode/FXPlayer");
	self.position = Vector2(origin.x + cos(angle) * radius, 
							origin.y + sin(angle) * radius);

func _process(delta):
	origin = Vector2(get_viewport_rect().size.x/2 ,
					 get_viewport_rect().size.y/2);
	self.position = Vector2(origin.x + cos(angle) * radius, 
							origin.y + sin(angle) * radius);
	self.rotate(delta * 4);

func _on_HealthBody_body_entered(body):
	if(body.name == "PlayerBody"):
		stream.stream = load("res://assets/sounds/Collect.wav");
		stream.play();
		print("1 UP!");
		body.health += 1;
		self.queue_free();
