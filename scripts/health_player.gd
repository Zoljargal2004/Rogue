extends Node2D

@export var collision:Node2D
@export var timer: Node
@export var health = 10
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		health -= 1
		collision.set_deferred("disabled", true)
		timer.start()
	print(health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
