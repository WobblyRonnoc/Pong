extends Control

@onready var player_speed_value = $MarginContainer2/VBoxContainer/HBoxContainer/PlayerSpeedValue
@onready var ball_speed_value = $MarginContainer2/VBoxContainer/HBoxContainer2/BallSpeedValue
@onready var player_speed_slider = $MarginContainer2/VBoxContainer/PlayerSpeedSlider
@onready var ball_speed_slider = $MarginContainer2/VBoxContainer/BallSpeedSlider



@onready var player_slow = $MarginContainer2/VBoxContainer/HBoxContainer/PlayerSlow
@onready var player_medium = $MarginContainer2/VBoxContainer/HBoxContainer/PlayerMedium
@onready var player_fast = $MarginContainer2/VBoxContainer/HBoxContainer/PlayerFast
@onready var player_speed_buttons = [player_slow, player_medium, player_fast]

@onready var ball_slow = $MarginContainer2/VBoxContainer/HBoxContainer2/BallSlow
@onready var ball_medium = $MarginContainer2/VBoxContainer/HBoxContainer2/BallMedium
@onready var ball_fast = $MarginContainer2/VBoxContainer/HBoxContainer2/BallFast
@onready var ball_speed_buttons = [ball_slow, ball_medium, ball_fast]

func reset_options():
	# update slider positions to reflect current speed values
	select_button("player", player_medium)
	select_button("ball", ball_medium)

	
# returns the global [player/ball]_speeds dictionary key for it's current numeric speed value
func get_current_speed_selection(entity: String) -> String: 
	if entity.to_lower() == "player":
		for speed in Global.player_speeds:
			if Global.player_speed == Global.player_speeds[speed]:
				return speed
	elif entity.to_lower() == "ball":
		for speed in Global.ball_speeds:
			if Global.ball_speed == Global.ball_speeds[speed]:
				return speed
	
	return "ERROR: not a valid entity"
func _ready():
	ball_speed_slider.value = Global.ball_speed
	player_speed_slider.value = Global.player_speed
	print(get_current_speed_selection("player"))
	print(get_current_speed_selection("ball"))
	
	if get_current_speed_selection("player") == "slow":
		select_button("player", player_slow)
	#TODO: this for every other speed/button combo...

	if get_current_speed_selection("player") == "medium":
		select_button("player", player_medium)

	if get_current_speed_selection("player") == "fast":
		select_button("player", player_fast)

func select_button(entity: String, button: Node) -> void: 
	if entity.to_lower() == "player":
		for btn in player_speed_buttons:
			if btn != button:
				btn.set_pressed_no_signal(false)
			else:
				btn.set_pressed_no_signal(true)
			
	if entity.to_lower() == "ball":
		for btn in ball_speed_buttons:
			if btn != button:
				btn.set_pressed_no_signal(false)
			else:
				btn.set_pressed_no_signal(true)
	

func _on_back_button_up():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	

func _on_player_speed_slider_value_changed(value):
	Global.player_speed = player_speed_slider.value
	player_speed_value.text = str(Global.player_speed)


func _on_ball_speed_slider_value_changed(value):
	Global.ball_speed = ball_speed_slider.value
	ball_speed_value.text = str(Global.ball_speed)


func _on_defaults_button_up():
	Global.ball_speed = 125
	Global.player_speed = 150
	
	select_button("player", player_medium)
	select_button("ball", ball_medium)
	
	# Set slider/label to defaults
	player_speed_value.text = str(Global.player_speed)
	ball_speed_value.text = str(Global.ball_speed)
	ball_speed_slider.value = Global.ball_speed 
	player_speed_slider.value = Global.player_speed

# Player Speed buttons
func _on_player_slow_toggled(button_pressed):
	select_button("player", player_slow)
	Global.player_speed = Global.player_speeds["slow"]

func _on_player_medium_toggled(button_pressed):
	select_button("player", player_medium)
	Global.player_speed = Global.player_speeds["medium"]

func _on_player_fast_toggled(button_pressed):
	select_button("player", player_fast)
	Global.player_speed = Global.player_speeds["fast"]

# Ball Speed buttons
func _on_ball_slow_toggled(button_pressed):
	select_button("ball", ball_slow)
	Global.ball_speed = Global.ball_speeds["slow"]

func _on_ball_medium_toggled(button_pressed):
	select_button("ball", ball_medium)
	Global.ball_speed = Global.ball_speeds["medium"]

func _on_ball_fast_toggled(button_pressed):
	select_button("ball", ball_fast)
	Global.ball_speed = Global.ball_speeds["fast"]
