extends Node2D

var click_count=0
var main_click=1

var LVL = 0
var lvl_indx=0

const Question = [preload("res://questions/Questions1.tscn")]
var question_size=1

const JumpClick = [preload("res://jumpClicker/Czolg.tscn"), preload("res://jumpClicker/Motor.tscn")]
var jump_click_size=1

var buldings ={"Zabka":2, "Policja":1, "Polsat":3, "BankPolski":2, "Metro":3, "Legia":1, "Biedronka":1, "ZUS":2, "Mleczarnia":3, "Pila":2, "PanPawel":1}

var next_lvl_permision=false

func _ready():
	LVL = $Levels.get_children()
	LVL[lvl_indx].visible=1
	lvl_indx+=1
	

func _process(delta):
	if Input.is_action_just_pressed("mouseRight"):
		$Money.hideAll();

func change_character(s):
	$MainClick2.change_sprite(s)
	
func next_lvl():
	if next_lvl_permision:
		next_lvl_permision=false
		LVL[lvl_indx-1].visible=0
		LVL[lvl_indx].visible=1
		lvl_indx+=1
		lvl_indx%=5#PAMIETAJ O TYM ASDFASGIGNDKAJGDSJGJSDGJDSFGGSDGSDFGSDGDS
	
	
func showBulding(x):
	print(x)
	LVL[lvl_indx-1].show_sprite(buldings[x])

func _on_Timer_timeout():
	$Money.addMoney()
	
func display_question():
	var i = int(rand_range(0,1))
	var d =Question[0].instance()
	add_child(d)
	
func display_clicker():
	main_click=0
	var i = int(rand_range(0,1))
	var d =JumpClick[1].instance()
	$Money.add_child(d)


func _on_MainClick2_main_click(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("mouseLeft") && main_click:
			click_count+=1
			$Money.addPromil()
			$Money.addMoney()
			$MainClick2.button_scale(Vector2(0.01,0.01))
			$MainClick2/CPUParticles2D.emitting=1
		if event.is_action_released("mouseLeft") && main_click:
			$MainClick2.button_scale(Vector2(-0.01,-0.01))
			if click_count%10 == 0:
				display_question()
			if click_count%12 == 0:
				display_clicker()
