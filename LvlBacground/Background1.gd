extends "res://Lvl.gd"

var s2=0

func _ready():
	element_amount=5

func show_sprite(s):
	print(s)
	show_counter+=1
	if s2>0 && s==2:
		s=s2
	if s==1:
		$S1.visible=1
	if s==2:
		$S2.visible=1
		s2=4
	if s==3:
		$S3.visible=1
	if s==4:
		$S4.visible=1
		s2=5
	if s==5:
		$S5.visible=1	
		
	if show_counter==element_amount:
		all_unlock()

