extends Area2D

@export var Health_component:Node2D

func damage(attack):
	if Health_component:
		Health_component.damage(attack)
