tool
extends Control

func _draw():
	draw_rect(get_viewport_rect(), Color("#182a35"));
	draw_line(Vector2(0, get_viewport_rect().size.y/2), Vector2(get_viewport_rect().size.x, get_viewport_rect().size.y/2), Color(1, 0, 0, 0.5), 10);