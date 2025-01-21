extends Node2D
@onready var camera = get_node("player")
var enemy_scene = preload("res://scenes/enemy.tscn")
var bigcock_scene = preload("res://bigcock.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var player = get_parent().get_child("")
	pass


func _on_timer_timeout() -> void:
	var enemy = enemy_scene.instantiate()
	spawn_enemy(enemy)


func spawn_enemy(enemy) -> void:

	var camera_position = camera.position
	var spawn_distance = randf_range(250, 500)  
	var direction = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
	var spawn_position = camera_position + direction * spawn_distance
	
	enemy.position = spawn_position
	spawn_distance = randf_range(250, 500)
	spawn_position = camera_position + direction * spawn_distance
	add_child(enemy)

func _on_bigcock_timeout() -> void:
	var bigcock = bigcock_scene.instantiate()
	spawn_enemy(bigcock)
