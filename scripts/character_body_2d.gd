extends CharacterBody2D

var bullet_scene = preload("res://scenes/bullet.tscn")
var fireball_scene = preload("res://scenes/fireball.tscn")
var thunder_scene = preload("res://scenes/thunder.tscn")
var spear_scene = preload("res://scenes/spear.tscn")
var size = DisplayServer.screen_get_size()

const SPEED = 300.0


func _physics_process(delta: float) -> void:
	move()
	
func move() -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("move right","move left","move up","move down")
	velocity = direction * SPEED
	move_and_slide()

func find_nearest_enemy_direction() -> Vector2:
	var nearest_enemy = null
	var nearest_distance = INF  # Start with a very large distance
	var direction_vector = Vector2.ZERO  # Default direction is zero
	
	# Get the parent node (assuming enemies are children of the parent)
	var parent_node = get_parent()

	# Loop through all children of the parent node
	for child in parent_node.get_children():
		# Check if the child is in the "enemies" group
		if child.is_in_group("enemy"):
			# Calculate the distance to the enemy
			var distance = position.distance_to(child.position)
			
			if distance < nearest_distance:
				nearest_distance = distance  # Update the nearest distance
				nearest_enemy = child  # Update the nearest enemy
				direction_vector = (child.position - position).normalized()  # Calculate direction and normalize it
	
	# Return the normalized direction vector (or Vector2.ZERO if no enemy is found)
	return direction_vector

func _on_timer_timeout() -> void:
	shoot_all(bullet_scene,position,find_nearest_enemy_direction())

func _on_fireballcooldown_timeout() -> void:
	shoot_all(fireball_scene, position, find_nearest_enemy_direction())

func _on_thunderstormcooldown_timeout() -> void:
	shoot_all(thunder_scene,random_position(),Vector2(0,0))

func _on_spear_cooldown_timeout() -> void:
	shoot_all(spear_scene, position, find_nearest_enemy_direction())
	
func random_position():
	var camera_position = self.position
	var x = size[0] / 2
	var y = size[1] / 2
	var random_position = Vector2(camera_position[0] + randf_range(-x, x), camera_position[1] + randf_range(-y, y))
	return random_position
	
func shoot_all(skill, skill_posiotion, skill_direction):
	var skill_instat = skill.instantiate()
	skill_instat.position = skill_posiotion
	skill_instat.direction = skill_direction
	get_parent().add_child(skill_instat)
