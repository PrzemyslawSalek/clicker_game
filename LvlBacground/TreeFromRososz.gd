extends Area2D

var speed = 100
var velocity = Vector2()
var degree = Vector2()
var go=0
var pila=false

func _physics_process(delta):
	if go:
		get_parent().get_node("Sprite").visible=1
		if $S2.rotation_degrees>-90:
			velocity.y=speed*delta
			$S2.rotation_degrees-=0.5
			if pila:
				pila=!pila
				get_parent().get_node("Sprite").position.x+=8
			else:
				pila=!pila
				get_parent().get_node("Sprite").position.x-=5
			translate(velocity)
		else:
			$S2.visible=0
