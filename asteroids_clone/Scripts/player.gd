extends CharacterBody2D

var rotation_speed = 3
var acceleration = 5

const PROJECTILE = preload("res://Scenes/projectile.tscn")
@onready var shooting_point: CollisionShape2D = $shooting_point_area/shooting_point
@onready var propulsion: Sprite2D = $propulsion

func _ready() -> void:
	propulsion.visible = false

func _physics_process(delta: float) -> void:
	movement(delta)
	screen_warp()
	shoot()

func movement(delta):
	var accelerate = Input.is_action_pressed("up")
	var rotate_towards = Input.get_axis("left", "right")
	rotation += rotate_towards * rotation_speed * delta
	if accelerate:
		velocity += transform.x * acceleration
		
		propulsion.visible = true
	else:
		velocity += -velocity * delta
		propulsion.visible = false
	move_and_slide()

func screen_warp():
	var screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)

func shoot():
	var is_shooting = Input.is_action_just_pressed("shoot")
	if is_shooting:
		var new_projectile = PROJECTILE.instantiate()
		new_projectile.transform = shooting_point.global_transform
		get_tree().root.add_child(new_projectile)
