extends Node2D
class_name Walls

const SPEED = 70
@onready var _screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	position.x -= SPEED * delta

	if _screen_size.x < 0:
		queue_free()
