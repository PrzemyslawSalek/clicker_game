extends Node2D

var c=false

func _ready():
	$ready.play()
	
func _physics_process(delta):
	if !($Tak.playing || $Nie.playing) && c:
		queue_free()


func _on_Button_mouse_entered():
	$Button.rect_scale+=Vector2(0.05,0.05)


func _on_Button_mouse_exited():
	$Button.rect_scale+=Vector2(-0.05,-0.05)


func _on_Button_pressed():
	$Tak.play()
	position.y-=1000
	c=true


func _on_Button2_mouse_entered():
	$Button2.rect_scale+=Vector2(0.05,0.05)


func _on_Button2_mouse_exited():
	$Button2.rect_scale+=Vector2(-0.05,-0.05)


func _on_Button2_pressed():
	position.y-=1000
	$Nie.play()
	c=true
	
