extends Control


func _on_one_player_button_button_up():
	get_tree().change_scene_to_file("res://level.tscn")


func _on_quit_button_up():
	get_tree().quit(0)


func _on_two_player_button_button_up():
	get_tree().change_scene_to_file("res://level_2.tscn")
