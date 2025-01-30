extends PopupMenu

@onready var option1 = $VBoxContainer/Button
@onready var option2 = $VBoxContainer/Button2
@onready var option3 = $VBoxContainer/Button3
var x = [Global.random_scene(), randi_range(0,5)]
var y = [Global.random_scene(), randi_range(0,5)]
var z = [Global.random_scene(), randi_range(0,5)]
func _ready():
	print(x)
	option1.text = str(x[0],x[1])
	option2.text = str(y[0],y[1])
	option3.text = str(z[0],z[1])
	option1.connect("pressed", Callable(self, "_on_option1_pressed"))
	option2.connect("pressed", Callable(self, "_on_option2_pressed"))
	option3.connect("pressed", Callable(self, "_on_option3_pressed"))
func _on_option1_pressed():
	print("Option 1 selected!")
	handle_selection(x[0],x[1])

func _on_option2_pressed():
	print("Option 2 selected!")
	handle_selection(y[0],y[1])

func _on_option3_pressed():
	print("Option 3 selected!")
	handle_selection(z[0],z[1])

func handle_selection(skill,damage):
	print(skill)
	skill.get_node("damage").damage += damage
	print(skill.get_node("damage").damage)
	hide()
func show_popup():
	popup_centered()
	grab_focus()
	x = [Global.random_scene(), randi_range(0,5)]
	y = [Global.random_scene(), randi_range(0,5)]
	z = [Global.random_scene(), randi_range(0,5)]

func _on_button_pressed() -> void:
	print("Option 1 selected!")
	handle_selection(x[0],x[1])
