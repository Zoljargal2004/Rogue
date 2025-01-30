extends Node

# Preload the scene paths
var damage_array = [
	preload("res://scenes/bullet.tscn").instantiate(),
	preload("res://scenes/fireball.tscn").instantiate(),
	preload("res://scenes/spear.tscn").instantiate()
]

var level = 0

func random_scene():
	# Pick a random index from the array
	var random_index = int(randi_range(0, damage_array.size() -1))
	return damage_array[random_index]
