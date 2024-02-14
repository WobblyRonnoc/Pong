extends Control

@onready var player_speed_value = $MarginContainer2/VBoxContainer/HBoxContainer/PlayerSpeedValue
@onready var ball_speed_value = $MarginContainer2/VBoxContainer/HBoxContainer2/BallSpeedValue
@onready var player_speed_slider = $MarginContainer2/VBoxContainer/PlayerSpeedSlider
@onready var ball_speed_slider = $MarginContainer2/VBoxContainer/BallSpeedSlider

func _on_back_button_up():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
func _ready():
	ball_speed_slider.value = Global.ball_speed
	player_speed_slider.value = Global.player_speed

func _on_player_speed_slider_value_changed(value):
	Global.player_speed = player_speed_slider.value
	player_speed_value.text = str(Global.player_speed)


func _on_ball_speed_slider_value_changed(value):
	Global.ball_speed = ball_speed_slider.value
	ball_speed_value.text = str(Global.ball_speed)


func _on_defaults_button_up():
	Global.ball_speed = 125
	Global.player_speed = 150
	player_speed_value.text = str(Global.player_speed)
	ball_speed_value.text = str(Global.ball_speed)
	ball_speed_slider.value = Global.ball_speed 
	player_speed_slider.value = Global.player_speed
	
