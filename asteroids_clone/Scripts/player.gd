extends CharacterBody2D

var rotation_speed = 3
var acceleration = 10

func _physics_process(delta: float) -> void:
	movement(delta)
	

func movement(delta):
	var accelerate = Input.is_action_pressed("up")
	var rotate_towards = Input.get_axis("left", "right")
	
	rotation += rotate_towards * rotation_speed * delta
	if accelerate:
		velocity += transform.x * acceleration
		print(transform.x)
	else:
		velocity += -velocity * delta
	move_and_slide()
	
