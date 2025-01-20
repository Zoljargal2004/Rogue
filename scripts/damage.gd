extends Node2D

@export var damage = 1


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		area.damage(damage)
