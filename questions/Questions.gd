extends Node2D

func _ready():
	pass # Replace with function body.


func _on_Button_mouse_entered():
	$Button.rect_scale+=Vector2(0.05,0.05)


func _on_Button_mouse_exited():
	$Button.rect_scale+=Vector2(-0.05,-0.05)


func _on_Button_pressed():
	queue_free()


func _on_Button2_mouse_entered():
	$Button2.rect_scale+=Vector2(0.05,0.05)


func _on_Button2_mouse_exited():
	$Button2.rect_scale+=Vector2(-0.05,-0.05)


func _on_Button2_pressed():
	queue_free()
