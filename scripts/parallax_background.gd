extends ParallaxBackground

var direction = -1
var speed = 25

func _process(delta):
	scroll_offset.x += speed * delta * direction

func stop_movement():
	speed = 0
