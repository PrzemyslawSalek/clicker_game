extends "res://jumpClicker/JumpClicker.gd"

var c=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _physics_process(delta):
	if !$AudioStreamPlayer2D.playing && c:
		queue_free()
	elif !c:
		velocity.x=speed*delta*direction
		translate(velocity)
		if !$AudioStreamPlayer2D2.playing:
			$AudioStreamPlayer2D2.play()
		
func _on_JumpClicker_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouseLeft"):
			$TextureProgress.value+=10
		if event.is_action_released("mouseLeft"):
			$TextureProgress.visible=1
		if $TextureProgress.value==$TextureProgress.max_value && !c:
				$TextureProgress.visible=0
				get_parent().get_parent().main_click=1
				c=true
				$AudioStreamPlayer2D.play()
	
func _on_VisibilityNotifier2D_screen_exited():
	direction*=-1
	$Sprite.flip_h=!$Sprite.flip_h
