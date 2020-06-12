extends Node2D

signal final
var c=true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if visible && c:
		print("amedeusz mozart")
		c=false
		emit_signal("final")
		


func _on_Button_pressed():
	get_tree().quit()
