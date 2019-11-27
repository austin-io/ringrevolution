extends Control

var frame = 0;
const NUM_RINGS = 3;
var center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);

func _ready():
	$AnimationPlayer.play("JumpIn");
	$EnemySprite.set_visible(false);
	center = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);

func _draw():
	var points = PoolVector2Array();	
	for i in range(NUM_RINGS):
		points = PoolVector2Array();
		
		for j in range(61):
			points.append( Vector2(
				center.x + cos(j * 6 * PI / 180) * (i * 100 + 50), 
				center.y + sin(j * 6 * PI / 180) * (i * 100 + 50)) 
			);
			
		draw_polyline(points, Color(0.5,0.5,0.5,0.5), 20);
	return;