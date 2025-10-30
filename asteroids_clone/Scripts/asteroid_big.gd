extends StaticBody2D

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
	print("exploded")
