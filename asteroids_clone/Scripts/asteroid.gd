extends StaticBody2D

@export var asteroid_type :String

var speed: int = 100
var randomx
var randomy
var direction 
var random_dir

func _ready() -> void:
	randomx = randf_range(-1,1)
	randomy = randf_range(-1,1)
	direction = Vector2(randomx,randomy).normalized()

func _physics_process(delta: float) -> void:
	move(delta)
	screen_warp()

func move(delta):
	position += speed * direction * delta

func screen_warp():
	var screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func explode():
	if asteroid_type == "big":
		var new_asteroid_medium = AsteroidManager.ASTEROID_MEDIUM.instantiate()
		var new_asteroid_medium_2 = AsteroidManager.ASTEROID_MEDIUM.instantiate()
		new_asteroid_medium.position = position
		new_asteroid_medium_2.position = position
		get_tree().root.call_deferred("add_child", new_asteroid_medium)
		get_tree().root.call_deferred("add_child", new_asteroid_medium_2)
		
	elif asteroid_type == "medium":
		var new_asteroid_small = AsteroidManager.ASTEROID_SMALL.instantiate()
		var new_asteroid_small_2 = AsteroidManager.ASTEROID_SMALL.instantiate()
		new_asteroid_small.position = position
		new_asteroid_small_2.position = position
		get_tree().root.call_deferred("add_child", new_asteroid_small)
		get_tree().root.call_deferred("add_child", new_asteroid_small_2)
		
	else:
		pass
