extends Node2D

var show_counter=0
export var element_amount=3

func _ready():
	pass

func all_unlock():
	get_parent().get_parent().next_lvl_permision=true

func show_sprite(s):
	print(s)
	show_counter+=1
	
	if s==1:
		$S1.visible=1
	if s==2:
		$S2.visible=1
	if s==3:
		$S3.visible=1
		
	if show_counter==element_amount:
		all_unlock()

