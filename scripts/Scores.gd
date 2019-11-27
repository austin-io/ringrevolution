extends Node

var filepath : String = "user://scoredata.save";
onready var file = File.new();
var highscore = 0 setget set_bestscore;

func _ready():
	if(!file.file_exists(filepath)):
		file.open(filepath, File.WRITE);
		file.store_var(highscore);
		file.close();
	else:
		load_score();
	return;

func load_score():
	file.open(filepath, File.READ);
	highscore = file.get_var();
	file.close();
	return;
	
func save_score():
	file.open(filepath, File.WRITE);
	file.store_var(highscore);
	file.close();
	return;
	
func set_bestscore(score):
	highscore = score;
	save_score();
	return;