extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_groups() == []:
		return
	if area.get_groups()[0] == "foodPicker":
		var level = get_parent().get_child(0).get_node("levelSystem")
		level.current_xp += 1
		queue_free()
