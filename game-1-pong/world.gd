extends Node

@onready var _ball = $Ball
@onready var _left_label = $Control/Left
@onready var _right_label = $Control/Right

@onready var _left_score = 0
@onready var _right_score = 0

func _physics_process(delta: float) -> void:
	if _ball.position.x < 0:
		_right_score += 1
		_right_label.text = str(_right_score)
	
	if _ball.position.x > 320:
		_left_score += 1
		_left_label.text = str(_left_score)
