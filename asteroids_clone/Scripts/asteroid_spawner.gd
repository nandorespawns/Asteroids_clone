extends Node

var window_size = Vector2(1024,768)
var location = Vector2()

const ASTEROID_BIG = preload("res://Scenes/asteroid_big.tscn")

var top_screen = 81
var bot_screen = 715
var left_screen = 120
var right_screen = 950

var asteroid_count = 5
var current_asteroids = 0

var is_stage_completed = false
var spawns = ["top","bot","left","right"]


func _process(delta: float) -> void:
	if is_stage_completed == true:
		spawn_asteroids()

func spawn_asteroids():
	randomize()
	
	for asteroid in range(0, asteroid_count):
		var key = spawns.pick_random()
		match key:
			"top":
				location.x = randi_range(left_screen,right_screen)
				location.y = top_screen
			"bot":
				location.x = randi_range(left_screen, right_screen)
				location.y = bot_screen
			"left":
				location.x = left_screen 
				location.y = randi_range(top_screen, bot_screen)
			"right":
				location.x = right_screen
				location.y = randi_range(top_screen, bot_screen)
				
		var new_asteroid = ASTEROID_BIG.instantiate()
		new_asteroid.position = location
		add_child(new_asteroid)
		is_stage_completed = false
