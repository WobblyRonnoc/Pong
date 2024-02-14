extends Node

var p1_up = "LeftPaddleUp"
var p1_down = "LeftPaddleDown"

var p2_up = "RightPaddleUp"
var p2_down = "RightPaddleDown"

var p1_score : int = 0
var p2_score : int = 0

var window_pos_x = 880
var window_pos_y = 487

var window_x = 160
var window_y = 144

var player_speed = 150
var ball_speed = 125

func _process(delta):
	#get_window().position = Vector2i(880, 487)
	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().change_scene_to_file("res://main_menu.tscn")

	if Input.is_action_just_pressed('scale1'):
		get_window().size = Vector2i(160, 144)

	if Input.is_action_just_pressed('scale2'):
		get_window().size = Vector2i(320, 288)

	if Input.is_action_just_pressed('scale3'):
		get_window().size = Vector2i(625, 563)
	
		
