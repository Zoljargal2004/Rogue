extends Node2D

var damage = 1
var angle = 0.0
var radius = 100
@export var pierce = 5
@export var speed = 900
var player_position = GlobalVar.player_positon
# Called when the node enters the scene tree for the first time.
func _ready() -> void:


	var level = GlobalVar.player_level
	damage = 1 + level * 1
	var max_count = 5 + level * 1
	GlobalVar.wisp_max_count = max_count
	print(max_count)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		speed = 300
		var direction = (-global_position + get_global_mouse_position()).normalized()
		position += direction * speed * delta
	else:
		speed = 2000
		angle += speed/10 * delta
		if angle >= 360:
			angle-= 360
		var x =  radius * cos(deg_to_rad(angle))  # Convert angle to radians for trig functions
		var y =  radius * sin(deg_to_rad(angle))
	
		position = position.move_toward(Vector2(x,y),speed * delta)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_groups() == []:
		return
	if area.get_groups()[0] == "enemy":
		pierce -= 1
		if pierce <= 0:
			GlobalVar.wisp_count -= 1
			queue_free()
		

	
