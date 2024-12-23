extends Node2D

var walls_scene = load("res://walls.tscn")

@onready var _screen_size = get_viewport_rect().size
@onready var _timer = $Timer

func _ready() -> void:
	_timer.start()

func _on_timer_timeout() -> void:
	var walls = walls_scene.instantiate()
	walls.position = Vector2(_screen_size.x + 20, randi_range(-55, 55))
	get_tree().root.add_child(walls)

	_timer.start()
