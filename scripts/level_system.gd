extends Node2D

var level = 0
var current_xp = 0
var xp_to_next_level = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_xp >= xp_to_next_level:
		current_xp -= xp_to_next_level
		xp_to_next_level += 5
		level+=1
	Global.level = level
