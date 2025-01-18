extends Node2D

var food_scene = preload("res://scenes/food.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_parent().get_node("player")
	var direction = (player.position - position).normalized()
	var speed = 100  
	position += direction * speed * delta


<<<<<<< HEAD
=======
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
		if area.name == "thunder":
			var thunder = area.get_parent()
			hp -= thunder.damage
>>>>>>> upstream/init

func enemy_die() -> void:
	var food = food_scene.instantiate()
	food.position = position
	get_parent().add_child(food)
	var death = get_parent().get_node("AudioStreamPlayer")
	if death:
		death.play()
	queue_free()
	
