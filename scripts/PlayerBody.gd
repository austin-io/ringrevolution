extends KinematicBody2D

enum Ring {INNER = 0, MIDDLE, OUTER};

const INNER_RING_RADIUS = 125;
const RING_DISTANCE = 75;

var health : int;
var ring : int;
var origin : Vector2;
var speed : float;
var radius : float;
var tick : float = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	origin = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	ring = Ring.INNER;
	health = 5;
	speed = 2;
	radius = ring * RING_DISTANCE + INNER_RING_RADIUS;
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	tick += delta;
	origin = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	self.position.x = origin.x + cos(tick * speed) * radius;
	self.position.y = origin.y + sin(tick * speed) * radius;
	speed += delta * delta / 4;
	#print("Speed: ", str(speed));
	return;

func _input(event):

	if(event is InputEventKey):
		if(event.is_action_released("ui_down") and radius > INNER_RING_RADIUS):
			ring -= 1;
			radius = ring * RING_DISTANCE + INNER_RING_RADIUS;
			get_tree().get_root().get_node("World/SoundNode/MovementPlayer").play();
		elif(event.is_action_released("ui_up") and radius < INNER_RING_RADIUS + (Ring.OUTER * RING_DISTANCE)):
			ring += 1;
			radius = ring * RING_DISTANCE + INNER_RING_RADIUS;
			get_tree().get_root().get_node("World/SoundNode/MovementPlayer").play();
	return;

func _draw():
	draw_circle(Vector2(0,0), 32, Color("#4de1a9"));
	return;

func _on_SwipeDetector_swiped(gesture):
	if(gesture.get_direction() == "up" and radius < INNER_RING_RADIUS + (Ring.OUTER * RING_DISTANCE)):
		ring += 1;
		radius = ring * RING_DISTANCE + INNER_RING_RADIUS;
		get_tree().get_root().get_node("World/SoundNode/MovementPlayer").play();
	elif(gesture.get_direction() == "down" and radius > INNER_RING_RADIUS):
		ring -= 1;
		radius = ring * RING_DISTANCE + INNER_RING_RADIUS;
		get_tree().get_root().get_node("World/SoundNode/MovementPlayer").play();
	return;