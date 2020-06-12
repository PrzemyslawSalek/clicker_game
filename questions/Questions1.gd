extends "res://questions/Questions.gd"

var c1=false
var c2=false
var c3=true

func _ready():
	$ready.playing=0
	
func _physics_process(delta):
	if !$Nie.playing && !c3:
		c3=true
		c1=true
		$Nie.stream=load("res://sound/questions/VCLJaJestem.wav")
	if !($Tak.playing || $Nie.playing) && c1 && c2:
		queue_free()
	



func _on_Button_pressed():
	c1=true
	c2=true
	position.y-=1000
	$Tak.play()



func _on_Button2_pressed():
	if c1:
		c2=true
	c1=true
	c3=false
	if c2:
		position.y-=1000
	$Nie.play()
