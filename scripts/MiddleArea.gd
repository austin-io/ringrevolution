extends Area2D

const MAX_ENEMIES = 6;
const WAIT_TIME_MAX = 20;
const WAIT_TIME_MIN = 10;
var enemyQueue = [];
var timer;

func _ready():
	timer = Timer.new();
	timer.set_wait_time(rand_range(WAIT_TIME_MIN, WAIT_TIME_MAX));
	timer.connect("timeout", self, "spawnCube");
	add_child(timer);
	timer.start();

func spawnCube():
	get_tree().get_root().get_node("World").add_child( load("res://scenes/HealthNode.tscn").instance() );
	print("Spawning health");
	timer.set_wait_time(rand_range(WAIT_TIME_MIN, WAIT_TIME_MAX));
	timer.start();

func _on_MiddleArea_body_exited(body):
	
	# Spawn new enemy on collision
	if(body.name == "PlayerBody"): 
		if(enemyQueue.size() >= MAX_ENEMIES):
			enemyQueue.front().queue_free();
			enemyQueue.pop_front();
			print("Pop front Triangle");
			
		print("Spawning new Triangle");
		enemyQueue.push_back(load("res://scenes/EnemyNode.tscn").instance());
		get_tree().get_root().get_node("World").add_child(enemyQueue.back());
		
		if(body.position.x > get_viewport_rect().size.x/2):
			enemyQueue.back().get_child(0).angle = -enemyQueue.back().get_child(0).angle;
		
	return;
