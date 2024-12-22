extends Area2D

var SPEED = 100

func _physics_process(delta: float) -> void:
	var paddle = name.to_lower()
	var speed = SPEED * delta
	
	if  Input.is_action_pressed("key_up_" + paddle) and position.y > 15:
		position.y -= speed
	
	if Input.is_action_pressed("key_down_" + paddle) and position.y < 166:
		position.y += speed
