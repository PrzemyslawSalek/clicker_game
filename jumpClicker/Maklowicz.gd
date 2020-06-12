extends "res://jumpClicker/CoToSieStanelo.gd"


func _physics_process(delta):
	speed+=10
	if position.y < 300:
		velocity.y=speed*delta
		translate(velocity)
	elif c:
		$AudioStreamPlayer2D2.play()
		c=false
