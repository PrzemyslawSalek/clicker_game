extends "res://Lvl.gd"


func show_sprite(s):
	print(s)
	show_counter+=1
	
	if s==1:
		$S1.visible=1
	if s==2:
		$TreeFromRososz.go=1
	if s==3:
		$S3.visible=1
		
	if show_counter==element_amount:
		all_unlock()
