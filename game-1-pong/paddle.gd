extends Area2D

var SPEED = 80

func _physics_process(delta: float) -> void:
	var speed = SPEED * delta
	
	_player_input(speed)

func _player_input(speed):
	var paddle = name.to_lower()

	if  Input.is_action_pressed("key_up_" + paddle) and position.y > 15:
		position.y -= speed

	if Input.is_action_pressed("key_down_" + paddle) and position.y < 166:
		position.y += speed
