extends Node2D

@export var speed = 100
var food_scene = preload("res://scripts/food.gd")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_parent().get_node("player")
	var direction = (player.position - position).normalized()
	
	position += direction * speed * delta

func enemy_die() -> void:
	var food = food_scene.instantiate()
	food.position = position
	get_parent().add_child(food)
	var death = get_parent().get_node("AudioStreamPlayer")
	if death:
		death.play()
	queue_free()
	
