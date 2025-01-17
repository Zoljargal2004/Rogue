extends Node2D
var speed = 1000
var direction: Vector2
var damage = 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed * delta * direction
	
	


func _on_bullet_area_entered(area: Area2D) -> void:
	if area.get_groups() == []:
		return
	if area.get_groups()[0] == 'enemy':
		queue_free()


func _on_timer_timeout() -> void:
	queue_free()
