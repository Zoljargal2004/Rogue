extends Node2D

@export var MAX_HEALTH := 10.0
var health :float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = MAX_HEALTH


func damage(attack):
	health -= attack
	
	if health <= 0:
		get_parent().queue_free()
