extends Area2D

const RING_DISTANCE = 75;

var origin = Vector2(get_viewport_rect().size.x/2, 
					 get_viewport_rect().size.y/2);
var radius : float;
var angle : float;
var stream : AudioStreamPlayer;

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
	self.rotate(delta);

func _on_EnemyBody_body_entered(body):
	if(body.name == "PlayerBody"):
		
		get_tree().get_root(). get_node("World/BackgroundNode/ScreenShake").shake(10, 0.3, 10);
		print("Collision");
		body.health -= 1;	
		angle = rand_range(1, 360);
		radius = (randi() % 3 + 1) * RING_DISTANCE + 50;
		self.queue_free();
		
		if(body.health <= 0):
			var score = get_tree().get_root().get_node("World/Control/StatsContainer/ScoreLabel").score;
			if(score > Scores.highscore):
				Scores.highscore = score;
			var gameOver = get_tree().get_root().get_node("World/GameOver/GameOverControl");
			gameOver.set_visible(true);
			gameOver.get_node("Container/Score").text = "Score: " + str(stepify(score * 10, 1));
			gameOver.get_node("Container/Highscore").text = "High Score: " + str(stepify(Scores.highscore * 10, 1));
			get_tree().set_pause(true);
		else:
			stream.stream = load("res://assets/sounds/Hit.wav");
			stream.play();