extends Control

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
	select_button("player", player_slow)
	select_button("ball", ball_slow)

func update_buttons():
	if get_current_speed_of("player") == "slow":
		select_button("player", player_slow)

	if get_current_speed_of("player") == "medium":
		select_button("player", player_medium)

	if get_current_speed_of("player") == "fast":
		select_button("player", player_fast)

	if get_current_speed_of("ball") == "slow":
		select_button("ball", ball_slow)
		
	if get_current_speed_of("ball") == "medium":
		select_button("ball", ball_medium)
		
	if get_current_speed_of("ball") == "fast":
		select_button("ball", ball_fast)


# returns the global [player/ball]_speeds dictionary key for it's current numeric speed value
func get_current_speed_of(entity: String) -> String: 
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
	update_buttons()


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
	

func _on_defaults_button_up():
	Global.ball_speed = Global.ball_speeds["medium"]
	Global.player_speed = Global.player_speeds["medium"]
	
	select_button("player", player_medium)
	select_button("ball", ball_medium)

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
