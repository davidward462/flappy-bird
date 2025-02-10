extends ParallaxBackground

var direction = -1
var speed = 15
var moving = 0

func _process(delta) -> void:
	scroll_offset.x += speed * delta * direction * moving

func start_movement() -> void:
	moving = 1

func stop_movement() -> void:
	moving = 0
