extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var levelSys =  get_parent().get_parent().get_node("levelSystem")
	self.text = 'xp: ' + str(levelSys.current_xp) + '/' + str(levelSys.xp_to_next_level) 
