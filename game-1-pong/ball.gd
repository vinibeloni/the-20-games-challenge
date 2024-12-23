extends Area2D

var score_sound = load("res://sounds/score.wav")
var bounce_sound = load("res://sounds/ball.mp3")

@export var SPEED: float = 100

var bounce_x: bool = false
var bounce_y: bool = false

@onready var _screen = get_viewport_rect().size
@onready var audio_player = $Bounce

func _physics_process(delta):
	if position.x > _screen.x or position.x < 0:
		_reset()
		
	if position.y > _screen.y or position.y < 0:
		bounce_y = !bounce_y
		_play_bounce()

	var speed = SPEED * delta
	position.x += speed if bounce_x else -speed
	position.y += speed if bounce_y else -speed

func _reset() -> void:
	position = Vector2(_screen.x / 2, _screen.y / 2)
	bounce_y = randi() % 2 == 0
	bounce_x = randi() % 2 == 0
	_play_score()
	
func _on_area_entered(area: Area2D) -> void:
	bounce_x = !bounce_x
	_play_bounce()

func _play_bounce():
	audio_player.stream = bounce_sound
	audio_player.play()

func _play_score():
	audio_player.stream = score_sound
	audio_player.play()
