extends Node2D

var speed:int = 300



func _physics_process(delta: float) -> void:
	movement(delta)

func movement(delta):
	var screen_size = get_viewport_rect().size
	position.x = wrapf(position.x, 0, screen_size.x)
	position.y = wrapf(position.y, 0, screen_size.y)
	position += transform.x * speed * delta

func _on_despawn_timer_timeout() -> void:
	queue_free()

func _on_hitbox_body_entered(body: Node2D) -> void:
	body.explode()
	body.queue_free()
	queue_free()
