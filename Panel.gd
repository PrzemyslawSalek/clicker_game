extends Panel


const Store = preload("res://Store.tscn")
var store
var store_is_activ=0
const StoreIcon = ["res://gui/ZlotyButton.png", "res://gui/exit_button.png"]

const Buldings = preload("res://Buldings.tscn")
var buldings
var buldings_is_activ=0
const BuldingsIcon = ["res://gui/PromileButton.png", "res://gui/PromileButton_exit.png"]


const SoundIcon = ["res://gui/sound_icon1.png", "res://gui/sound_icon2.png"]
var sound=1

const ScreenIcon = ["res://gui/fullScreenMax.png", "res://gui/fullScreenMin.png"]
var screen=0

var money=0
var money_per_second=1
var promil=0
var promil_per_click=1

var lvl_price = [1,1,1,10,2,9]

func hideAll():
	if store_is_activ:
		store_is_activ=!store_is_activ
		remove_child(store)
		$Store.icon=load(StoreIcon[0])
	if buldings_is_activ:
			buldings_is_activ=!buldings_is_activ
			remove_child(buldings)
			$Buldings2.icon=load(BuldingsIcon[0])

func soundPlay(x):
	$AudioStreamPlayer2D.stream=load(x)
	$AudioStreamPlayer2D.play()

func addMoney():
	money+=money_per_second
	$Money.text=str(money)+" zloty"

func subMoney(x):
	money-=x
	$Money.text=str(money)+" zloty"
		
	
func setMoneyPerSecond(x):
	money_per_second+=x
	$MoneyPerSecond.text=str(money_per_second)+" zl/sek"


func addPromil():
	promil+=promil_per_click
	$Promil.text=str(promil)+" %"
	
func subPromil(x):
	promil-=x
	$Promil.text=str(promil)+" %"
	
func setPromilPerClick(x):
	promil_per_click+=x
	$PromilPerClk.text=str(promil_per_click)+" %/klik"

func _ready():
	$Money.text=str(money)+" zloty"
	store = Store.instance()
	store.position=Vector2(1128, 132)
	buldings = Buldings.instance()
	buldings.position=Vector2(1128, 132)

func _process(delta):
	pass



func _on_Exit_pressed():
	get_tree().quit()


func _on_Mute_pressed():
	sound+=1;
	sound%=2;
	$Mute.icon = load(SoundIcon[sound])
	if sound:
		$SoundTrack.volume_db=-80
	else:
		$SoundTrack.volume_db=-30



func _on_Store_mouse_entered():
	$Click.play()
	$Store.rect_scale+=Vector2(0.01,0.01)


func _on_Store_mouse_exited():
	$Store.rect_scale+=Vector2(-0.01,-0.01)


func _on_Store_pressed():
	store_is_activ=!store_is_activ
	if store_is_activ:
		if buldings_is_activ:
			buldings_is_activ=!buldings_is_activ
			remove_child(buldings)
			$Buldings2.icon=load(BuldingsIcon[0])
		add_child(store)
		$Store.icon=load(StoreIcon[1])
	else:
		remove_child(store)
		$Store.icon=load(StoreIcon[0])


func _on_Buldings2_pressed():
	buldings_is_activ=!buldings_is_activ
	if buldings_is_activ:
		if store_is_activ:
			store_is_activ=!store_is_activ
			remove_child(store)
			$Store.icon=load(StoreIcon[0])
		add_child(buldings)
		$Buldings2.icon=load(BuldingsIcon[1])
	else:
		remove_child(buldings)
		$Buldings2.icon=load(BuldingsIcon[0])


func _on_Buldings2_mouse_entered():
	$Click.play()
	$Buldings2.rect_scale+=Vector2(0.01,0.01)


func _on_Buldings2_mouse_exited():
	$Buldings2.rect_scale+=Vector2(-0.01,-0.01)


func _on_FullScreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	screen+=1;
	screen%=2;
	$FullScreen.icon = load(ScreenIcon[screen])

func _on_NextLvl_pressed():
	if lvl_price[get_parent().lvl_indx]<=money:
		money-=lvl_price[get_parent().lvl_indx]
		get_parent().next_lvl()
		buldings.set_button(get_parent().lvl_indx)

func _on_NextLvl_mouse_entered():
	$Click.play()
	$NextLvl.rect_scale+=Vector2(0.01,0.01)


func _on_NextLvl_mouse_exited():
	$NextLvl.rect_scale+=Vector2(-0.01,-0.01)
