extends ParallaxLayer

var direction = -1
var speed = 7
var moving = 0

func _process(delta):
	motion_offset.x += speed * delta * direction * moving
	
func start_movement():
	moving = 1

func stop_movement():
	moving = 0
