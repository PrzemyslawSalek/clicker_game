extends "res://jumpClicker/JumpClicker.gd"
var c=true

func _physics_process(delta):
	speed+=10
	if position.x < 300:
		velocity.x=speed*delta
		translate(velocity)
	elif c:
		$AudioStreamPlayer2D2.play()
		c=false
