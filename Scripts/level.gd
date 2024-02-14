extends Node2D

var p1_score_label
var p2_score_label
@onready var ball = $Ball
var game_over_label
@onready var timer = $Timer
@onready var paddle = $Paddle
@onready var paddle2 = $Paddle2

var p1_home
var p2_home

var game_over_man = false

func _ready():
	p1_home = paddle.global_position.x
	p2_home = paddle2.global_position.x
	
	#initialize node references and setup for 2Player Scene
	if get_tree().current_scene.name == "Level2":
		p1_score_label = $StartButton/Control/P1Score
		p2_score_label = $StartButton/Control/P2Score
		game_over_label = $StartButton/Control/GameOverLabel
		game_over_label.hide()
		ball.velocity = Vector2.ZERO

func _physics_process(delta):
	paddle.global_position.x = p1_home
	paddle2.global_position.x = p2_home


func _process(delta):
	if p1_score_label && p2_score_label && game_over_label:
		if Global.p1_score > 9 && !game_over_man:
			game_over(1)
		elif Global.p2_score > 9 && !game_over_man:
			game_over(2)
			
		if !timer.is_stopped():
			p1_score_label.text = str(round(timer.time_left))
			p2_score_label.text = str(round(timer.time_left))
		else:
			p1_score_label.text = str(Global.p1_score)
			p2_score_label.text = str(Global.p2_score)
	
	if Input.is_action_just_pressed('ui_cancel'):
		get_tree().change_scene_to_file("res://main_menu.tscn")
	

func game_over(winner):
	game_over_man = true
	ball.set_physics_process(false)
	
	if winner == 1:
		game_over_label.text = "PLAYER\n1\nWINS"
		game_over_label.show()
	elif winner == 2:
		game_over_label.text = "PLAYER\n2\nWINS"
		game_over_label.show()
	timer.start()

func _on_texture_button_button_up():
	if randf() > 0.5:
		ball.velocity.y = 1 * ball.SPEED 
		ball.velocity.x = 1 * ball.SPEED
	else:
		ball.velocity.y = -1 * ball.SPEED 
		ball.velocity.x = -1 * ball.SPEED
		
	
	
	$StartButton/Control/TextureButton.hide()


func _on_timer_timeout():
	game_over_man = false
	Global.p1_score = 0
	Global.p2_score = 0
	
	get_tree().change_scene_to_file("res://level_2.tscn")
