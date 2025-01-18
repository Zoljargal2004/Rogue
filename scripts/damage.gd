class_name Damage
extends Node2D

@export var damage_fire := 1
@export var damage := 1
@export var damage_poison := 1
@export var damage_magic := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func damage_give(mult):
	var total = (damage + damage_fire + damage_magic + damage_poison) * mult
	return total



func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.has_method("damage"):
		area.damage(damage_give(1))
