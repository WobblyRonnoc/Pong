extends Control


func _on_one_player_button_button_up():
	get_tree().change_scene_to_file("res://level.tscn")


func _on_quit_button_up():
	get_tree().quit(0)


func _on_two_player_button_button_up():
	get_tree().change_scene_to_file("res://level_2.tscn")
	Global.p1_score = 0
	Global.p2_score = 0

func _on_options_button_up():
	get_tree().change_scene_to_file("res://options.tscn")
