extends Node2D

var food_scene = preload("res://scenes/food.tscn")
var bullet = preload("res://scenes/bullet.tscn")
var fireball_scene = preload("res://scenes/fireball.tscn")

var hp = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hp < 0:
		enemy_die()
	var player = get_parent().get_node("player")
	var direction = (player.position - position).normalized()
	var speed = 100  
	position += direction * speed * delta


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_groups() == []:
		return
	
	if area.get_groups()[0] == "damage":
		if area.name == "bullet":
			var bullet = bullet.instantiate()
			hp -= bullet.damage
		if area.name == 'fireball':
			var fireball = fireball_scene.instantiate()
			hp -= fireball.damage

func enemy_die() -> void:
	var food = food_scene.instantiate()
	food.position = position
	get_parent().add_child(food)
	queue_free()
