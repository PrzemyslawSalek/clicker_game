extends Node2D

signal main_click(event)

func change_sprite(s):
	$Button.icon=load(s)

func button_scale(vec):
	$Button.rect_scale+=vec

func _on_Button_gui_input(event):
	emit_signal("main_click",event)
