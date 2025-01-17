extends Node2D

var enemy_scene = preload("res://scenes/enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var player = get_parent().get_child("")
	pass


func _on_timer_timeout() -> void:
	spawn_enemy()


func spawn_enemy() -> void:

	var camera = get_node("player")
	

	var camera_position = camera.position
	

	var spawn_distance = randf_range(250, 500)  
	

	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
		

	var spawn_position = camera_position + direction * spawn_distance
	

	var enemy = enemy_scene.instantiate()
	

	enemy.position = spawn_position

	add_child(enemy)
