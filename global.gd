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

var player_speeds = {
	"slow": 100,
	"medium": 150,
	"fast": 200
}

var ball_speeds = {
	"slow": 100,
	"medium": 125,
	"fast": 200
}

var player_speed = player_speeds["medium"]
var ball_speed = ball_speeds["medium"]



func _process(delta):
	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().change_scene_to_file("res://main_menu.tscn")

	if Input.is_action_just_pressed('scale1'):
		get_window().size = Vector2i(160, 144)

	if Input.is_action_just_pressed('scale2'):
		get_window().size = Vector2i(320, 288)

	if Input.is_action_just_pressed('scale3'):
		get_window().size = Vector2i(625, 563)
	
		
