extends TextureButton

var panel=0
export var state=1#ta zmienan ustala ile razy moge kliknac w przycisk


export var price=0
export var path=""
export var money_per_sek=1
export var soundPath=""
export var lvl=0



func _ready():
	$Label.text="KOSZTA: " + str(price) + " zl"
	panel=get_parent().get_parent().get_parent().get_parent()
	$Label2.text=name


func _on_Character_pressed():
	if panel.get_parent().lvl_indx==lvl:
		if(panel.money>=price && state):
			panel.remove_child(panel.buldings)
			panel.get_node("Buldings2").icon=load(panel.BuldingsIcon[0])
			panel.buldings_is_activ=0
			panel.soundPlay(soundPath)
			state-=1
			panel.subMoney(price)
			panel.setMoneyPerSecond(money_per_sek)
			panel.get_parent().showBulding(name)
			if state==0:
				modulate=Color8(255,0,0,255)


func _on_Character_mouse_entered():
	if panel.get_parent().lvl_indx==lvl:
		$Click.play()
		rect_scale+=Vector2(0.01,0.01)


func _on_Character_mouse_exited():
	if panel.get_parent().lvl_indx==lvl:
		rect_scale+=Vector2(-0.01,-0.01)
