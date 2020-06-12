extends TextureButton

var panel=0
export var state=1
export var czy_drozeje=0

export var price=0
export var path=""
export var promil_per_clk=1
export var soundPath=""

func _ready():
	$Label.text="KOSZT: " + str(price) + " zl"
	panel=get_parent().get_parent().get_parent().get_parent()
	$Label2.text=name


func _on_Character_pressed():
	print("state"+str(state))
	if panel.promil>=price && state>0:
		panel.soundPlay(soundPath)
		state-=1
		if czy_drozeje:
			price+=panel.promil
			$Label.text="KOSZT: " + str(price) + " zl"
	
	if (panel.promil>=price) && !state:
		state-=1
		panel.remove_child(panel.store)
		panel.get_node("Store").icon=load(panel.StoreIcon[0])
		panel.store_is_activ=0
		panel.subPromil(price)
		panel.setPromilPerClick(promil_per_clk)
		panel.get_parent().change_character(path)
		#if !state:#tylko pudzian
		modulate=Color8(255,0,0,255)
	print("state1"+str(state))


func _on_Character_mouse_entered():
	$Click.play()
	rect_scale+=Vector2(0.01,0.01)


func _on_Character_mouse_exited():
	rect_scale+=Vector2(-0.01,-0.01)
