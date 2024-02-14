extends Control

@onready var player_speed_value = $MarginContainer2/VBoxContainer/HBoxContainer/PlayerSpeedValue
@onready var ball_speed_value = $MarginContainer2/VBoxContainer/HBoxContainer2/BallSpeedValue
@onready var player_speed_slider = $MarginContainer2/VBoxContainer/PlayerSpeedSlider
@onready var ball_speed_slider = $MarginContainer2/VBoxContainer/BallSpeedSlider

func _on_back_button_up():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	

func _on_player_speed_slider_value_changed(value):
	player_speed_value.text = str(Global.player_speed)
	Global.player_speed = player_speed_slider.value


func _on_ball_speed_slider_value_changed(value):
	ball_speed_value.text = str(Global.ball_speed)
	Global.ball_speed = ball_speed_slider.value
	
