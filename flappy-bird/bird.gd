extends CharacterBody2D

const JUMP = -100
@onready var _screen_y = get_viewport_rect().size.y

func _physics_process(delta: float) -> void:
	velocity += Vector2(0, 200) * delta
	
	if position.y > _screen_y:
		position.y = _screen_y / 2
		velocity = Vector2.ZERO

	# TODO: rotation

	if Input.is_action_just_pressed("ui_accept") and position.y > 20: # TODO: create a top wall using postion
		velocity.y = JUMP

	move_and_slide()
