extends CharacterBody2D

@export var SPEED : float = 100.0
@export_enum("One", "Two") var player : String
@onready var sprite = $Sprite

var up = "ui_up"
var down = "ui_down"

func _ready():
	if player == "Two":
		sprite.set_flip_h(true)
		up = Global.p2_up
		down = Global.p2_down
	elif player == "One":
		up = Global.p1_up
		down = Global.p1_down

func _physics_process(delta):
	if Input.is_action_pressed(down):
		velocity.y = SPEED
		move_and_slide()
	elif Input.is_action_pressed(up):
		velocity.y = -SPEED
		move_and_slide()
	else:
		velocity = Vector2.ZERO
