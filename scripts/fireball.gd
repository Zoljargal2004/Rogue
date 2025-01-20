extends Node2D

var explosion_scene = preload("res://scenes/explosion.tscn")
@export var speed = 1000
@export var damage: Node2D
@export var explosion_collision: Node2D
var direction: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed * delta * direction

	
func fire_ball_explodes() -> void:
	direction = Vector2(0,0)
	queue_free()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy"):
		explosion()
	
func explosion():
	var exploding = explosion_scene.instantiate()
	exploding.position = global_position
	get_parent().add_child(exploding)
	explosion_collision.set_deferred("disabled", false)

func _on_explosion_area_entered(area: Area2D) -> void:

	if area.has_method("damage"):
		area.damage(damage.damage)
	queue_free()
