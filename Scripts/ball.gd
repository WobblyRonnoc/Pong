extends CharacterBody2D

@onready var SPEED = Global.ball_speed

func _ready():
	velocity.y = SPEED
	velocity.x = SPEED 
	get_tree().paused

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		
		velocity = velocity.bounce(collision.get_normal())
		
		if collision.get_collider().name.contains("ScoreBox"):
			if collision.get_collider().name == "Player1ScoreBox":
				Global.p2_score += 1
			else: 
				Global.p1_score += 1

