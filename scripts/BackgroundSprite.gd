extends Sprite

func _ready():
	self.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	
func _process(delta):
	self.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);