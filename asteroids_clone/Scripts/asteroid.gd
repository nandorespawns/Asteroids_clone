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
	vfx()
	match asteroid_type:
		"big":
			spawn_asteroid("medium")
			spawn_asteroid("medium")
		"medium":
			spawn_asteroid("small")
			spawn_asteroid("small")
		_:
			pass

func spawn_asteroid(asteroid_type):
	var asteroid
	match asteroid_type:
		"medium":
			asteroid = AsteroidManager.ASTEROID_MEDIUM.instantiate()
		"small":
			asteroid = AsteroidManager.ASTEROID_SMALL.instantiate()
		_:
			return
	asteroid.position = position
	get_tree().root.call_deferred("add_child", asteroid)

func vfx():
	var explosion = AsteroidManager.EXPLOSION.instantiate()
	explosion.position = position
	explosion.emitting = true
	get_tree().root.call_deferred("add_child", explosion)
