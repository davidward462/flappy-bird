extends ParallaxLayer

var direction = -1
var speed = 7
var moving = 0

func _process(delta) -> void:
	motion_offset.x += speed * delta * direction * moving
	
func start_movement() -> void:
	moving = 1

func stop_movement() -> void:
	moving = 0
