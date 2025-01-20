extends Node2D

@export var Sprite:Node2D
@export var speed = 100
var food_scene = preload("res://scripts/food.gd")
var scaler = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var scaler = Sprite.scale.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_parent().get_node("player")
	var direction = (player.position - position).normalized()
	if direction.x <0:
		Sprite.scale.x = -scaler
	else:
		Sprite.scale.x = scaler
		
	position += direction * speed * delta

func enemy_die() -> void:
	var food = food_scene.instantiate()
	food.position = position
	get_parent().add_child(food)
	var death = get_parent().get_node("AudioStreamPlayer")
	if death:
		death.play()
	queue_free()
	
