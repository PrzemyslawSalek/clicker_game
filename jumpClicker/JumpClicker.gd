extends Area2D

var velocity = Vector2()
var speed=32
var direction = -1


func _on_JumpClicker_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouseLeft"):
			$TextureProgress.value+=10
		if event.is_action_released("mouseLeft"):
			$TextureProgress.visible=1
		if $TextureProgress.value==$TextureProgress.max_value:
				get_parent().get_parent().main_click=1
				queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	pass # Replace with function body.
