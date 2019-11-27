extends CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	self.get_shape().set_extents(Vector2(get_viewport_rect().size.x/2, 10));
	return;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2);
	self.get_shape().set_extents(Vector2(get_viewport_rect().size.x/2, 10));
	return;