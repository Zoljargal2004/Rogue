extends Node2D

@export var health = 10
@export var death = preload("res://scenes/death_enemy.tscn")
var food_scene = preload("res://scenes/food.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(attack):
	health -= attack
	if health <= 0:
		
		
		var death_effect = death.instantiate()
		death_effect.position = global_position
		get_parent().get_parent().add_child(death_effect)
		spawn_food()

		

func spawn_food() -> void:
	var food = food_scene.instantiate()
	food.xp = 2
	food.position = get_parent().position
	get_parent().get_parent().add_child(food)
	get_parent().queue_free()
