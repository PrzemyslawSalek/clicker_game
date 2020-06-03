extends "res://jumpClicker/JumpClicker.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass



func _physics_process(delta):
		velocity.x=speed*delta*direction
		translate(velocity)

	
func _on_VisibilityNotifier2D_screen_exited():
	direction*=-1
	$Sprite.flip_h=!$Sprite.flip_h
