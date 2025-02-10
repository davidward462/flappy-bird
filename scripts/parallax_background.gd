extends ParallaxBackground

var direction = -1
var speed = 15
var moving = 0

func _process(delta):
	scroll_offset.x += speed * delta * direction * moving

func start_movement():
	moving = 1

func stop_movement():
	moving = 0
