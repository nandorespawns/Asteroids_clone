extends Node


const PLAYER = preload("res://Scenes/player.tscn")
var player = PLAYER.instantiate()
var player_default_x = 505.0
var player_defaul_y = 423.0

const ASTEROID_SPAWNER = preload("res://Scenes/asteroid_spawner.tscn")

func _ready() -> void:
	player.position.x = player_default_x
	player.position.y = player_defaul_y
	add_child(player)
	player.died.connect(respawn)
	
	var asteroid_spawner = ASTEROID_SPAWNER.instantiate()
	asteroid_spawner.is_stage_completed = true
	add_child(asteroid_spawner)

func respawn():
	player.position.x = player_default_x
	player.position.y = player_defaul_y
	player.velocity *= 0
