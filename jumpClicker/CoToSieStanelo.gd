extends "res://jumpClicker/JumpClicker.gd"

var c=true

func ready():
	speed=0

func _physics_process(delta):
	speed+=10
	if position.y > 880:
		velocity.y=-speed*delta
		translate(velocity)
	elif c:
		$AudioStreamPlayer2D2.play()
		c=false

