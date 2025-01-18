extends Area2D

@export var health : Node2D

func damage(attack):
	if health:
		health.damage(attack)
