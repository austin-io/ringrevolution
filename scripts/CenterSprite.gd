extends Sprite

const NUM_RINGS = 3;

enum Ring {INNER = 0, MIDDLE, OUTER};
var ring;

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	ring = get_tree().get_root().get_node("World/PlayerNode/PlayerBody").ring;
	
func _process(delta):
	self.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	
	if(ring != get_tree().get_root().get_node("World/PlayerNode/PlayerBody").ring):
		ring = get_tree().get_root().get_node("World/PlayerNode/PlayerBody").ring;
		update();
	
func _draw():
	
	var points = PoolVector2Array();	
	for i in range(NUM_RINGS):
		points = PoolVector2Array();
		
		for j in range(61):
			points.append( Vector2(
				cos(j * 6 * PI / 180) * (i * 150 + 250), 
				sin(j * 6 * PI / 180) * (i * 150 + 250)) 
			);
			
		if(i == ring):
			draw_polyline(points, Color(1,1,1,1), 30);
		else:
			draw_polyline(points, Color(0.5,0.5,0.5), 30);