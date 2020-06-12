extends Node2D

var children_arr = 0

func _ready():
	children_arr = $Store/BuldingButtons.get_children()

func set_button(lvl):
	print(lvl)
	for x in children_arr:
		if x.lvl == lvl:
			print("ustawiam"+x.name)
			x.set_modulate(Color("ffffff"))
		
