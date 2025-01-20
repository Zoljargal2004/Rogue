extends Node2D

@export var health = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func damage(attack):
	health -= attack
	if health <= 0:
		get_parent().queue_free()
