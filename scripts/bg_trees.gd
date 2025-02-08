extends ParallaxLayer

var direction = -1
var speed = 7

func _process(delta):
	motion_offset.x += speed * delta * direction

func stop_movement():
	speed = 0
